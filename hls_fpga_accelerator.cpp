#include "ap_fixed.h"
#include "hls_stream.h"
#include <iostream>
using namespace std;

#define N 15  // Input feature size
#define B 32  // Batch size
#define L1 30 // Number of neurons in layer 1
#define L2 24 // Number of neurons in layer 2
#define L3 19 // Number of neurons in layer 3

typedef float data_t; // Fixed-point data type

// Leaky ReLU activation function
data_t leaky_relu(data_t x) {
    data_t zero = 0;
    data_t alpha = 0.01;
    return (x > zero) ? x : (x * alpha);
}

// Dense Layer function
void dense_layer_1(data_t input[B][N], data_t output[B][L1], data_t weights[L1][N], data_t bias[L1]) {
    for (int i = 0; i < B; i++) {
        for (int r = 0; r < L1; r++) {
            output[i][r] = bias[r];
            for (int j = 0; j < N; j++) {
                output[i][r] += input[i][j] * weights[r][j];
            }
        }
    }
}

void dense_layer_2(data_t input[B][L1], data_t output[B][L2], data_t weights[L2][L1], data_t bias[L2]) {
    for (int i = 0; i < B; i++) {
        for (int r = 0; r < L2; r++) {
            output[i][r] = bias[r];
            for (int j = 0; j < L1; j++) {
                output[i][r] += input[i][j] * weights[r][j];
            }
        }
    }
}

void dense_layer_3(data_t input[B][L2], data_t output[B][L3], data_t weights[L3][L2], data_t bias[L3]) {
    for (int i = 0; i < B; i++) {
        for (int r = 0; r < L3; r++) {
            output[i][r] = bias[r];
            for (int j = 0; j < L2; j++) {
                output[i][r] += input[i][j] * weights[r][j];
            }
        }
    }
}

void output_layer(data_t input[B][L3], data_t output[B][1], data_t weights[1][L3], data_t bias[1]) {
    for (int i = 0; i < B; i++) {
        output[i][0] = bias[0];
        for (int j = 0; j < L3; j++) {
            output[i][0] += input[i][j] * weights[0][j];
        }
    }
}

// Neural network accelerator
void neural_net(data_t input[B][N], data_t y1_output[B][1], data_t y2_output[B][1],
                data_t w1[L1][N], data_t b1[L1],
                data_t w2[L2][L1], data_t b2[L2],
                data_t w3[L3][L2], data_t b3[L3],
                data_t w4[1][L3], data_t b4[1],
                data_t w5[1][L3], data_t b5[1]) {

    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE m_axi port=input bundle=aximm1
    #pragma HLS INTERFACE m_axi port=y1_output bundle=aximm1
    #pragma HLS INTERFACE m_axi port=y2_output bundle=aximm1
    #pragma HLS INTERFACE m_axi port=w1 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=w2 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=w3 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=w4 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=w5 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=b1 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=b2 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=b3 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=b4 bundle=aximm2
    #pragma HLS INTERFACE m_axi port=b5 bundle=aximm2


    data_t layer1_out[B][L1], layer2_out[B][L2], layer3_out[B][L3];

    // Layer 1
    dense_layer_1(input, layer1_out, w1, b1);
    for (int i = 0; i < B; i++) {
        for (int j = 0; j < L1; j++) {
            layer1_out[i][j] = leaky_relu(layer1_out[i][j]);
        }
    }

    // Layer 2
    dense_layer_2(layer1_out, layer2_out, w2, b2);
    for (int i = 0; i < B; i++) {
        for (int j = 0; j < L2; j++) {
            layer2_out[i][j] = leaky_relu(layer2_out[i][j]);
        }
    }

    // Layer 3
    dense_layer_3(layer2_out, layer3_out, w3, b3);
    for (int i = 0; i < B; i++) {
        for (int j = 0; j < L3; j++) {
            layer3_out[i][j] = leaky_relu(layer3_out[i][j]);
        }
    }

    // Y1 output (real part of the signal)
    output_layer(layer3_out, y1_output, w4, b4);

    // Y2 output (imaginary part of the signal)
    output_layer(layer3_out, y2_output, w5, b5);
}
