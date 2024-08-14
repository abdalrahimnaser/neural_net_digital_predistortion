#include "ap_fixed.h"
#include "hls_stream.h"
#include <iostream>
using namespace std;

#define N 15 // Input feature size
#define B 32 // Batch size
#define L1 30 // no. neurons layer 1
#define L2 24 // no. neurons layer 2
#define L3 19 // no. neurons layer 3

typedef float data_t; // Fixed point data type

// Leaky ReLU activation function

data_t leaky_relu(data_t x) {
    data_t zero = 0;
    data_t alpha = 0.01;
    if (x > zero) {
    	return x;
    } else{
    	return x * alpha;
    }
}




// note here i am not doing it as a custom func, but rather matmul ops, please compare with the custom implementation of c
// chatgpt, run synthesis and see the dif

// Dense Layer function
void dense_layer_1(data_t input[B][N], data_t output[B][L1], data_t weights[L1][N], data_t bias[L1]) {
	for (int i = 0; i < B; i++) {
    	output[i] = bias;
        for(int r = 0; r < L1; r++){
        	for (int j = 0; j < N; j++) {
        		output[i][r] += input[i][j] * weights[r][j];
        	        }
//        		output[i][r] += bias[r];
        	    }
    }
        }

void dense_layer_2(data_t input[B][L1], data_t output[B][L2], data_t weights[L2][L1], data_t bias[L2]) {
	for (int i = 0; i < B; i++) {
    	output[i] = bias;
        for(int r = 0; r < L2; r++){
        	for (int j = 0; j < L1; j++) {
        		output[i][r] += input[i][j] * weights[r][j];
        	        }
//        		output[i][r] += bias[r];
        	    }
    }
        }

void dense_layer_3(data_t input[B][L2], data_t output[B][L3], data_t weights[L3][L2], data_t bias[L3]) {
	for (int i = 0; i < B; i++) {
    	output[i] = bias;
        for(int r = 0; r < L3; r++){
        	for (int j = 0; j < L2; j++) {
        		output[i][r] += input[i][j] * weights[r][j];
        	        }
//        		output[i][r] += bias[r];
        	    }
    }
        }

void dense_layer_4(data_t input[B][L3], data_t output[B][1], data_t weights[1][L3], data_t bias[1]) {
	for (int i = 0; i < B; i++) {
    	output[i][0] = bias;
		for (int j = 0; j < L3; j++) {
			output[i][0] += input[i][j] * weights[0][j];
		}
//		output[i][0] += bias[0];
	}
}
// Neural network accelerator
void neural_net(data_t input[B][N], data_t y1_output[B][1], data_t y2_output[B][1],
                data_t w1[L1][N], data_t b1[L1],
                data_t w2[L2][L1], data_t b2[L2],
                data_t w3[L3][L2], data_t b3[L3],
                data_t w4[L3][1], data_t b4[1],
                data_t w5[L3][1], data_t b5[1]) {

	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS INTERFACE mode=s_axilite port=input
	#pragma HLS INTERFACE mode=s_axilite port=y1_output
	#pragma HLS INTERFACE mode=s_axilite port=y2_output
	#pragma HLS INTERFACE mode=s_axilite port=w1
	#pragma HLS INTERFACE mode=s_axilite port=w2
	#pragma HLS INTERFACE mode=s_axilite port=w3
	#pragma HLS INTERFACE mode=s_axilite port=w4
	#pragma HLS INTERFACE mode=s_axilite port=w5
	#pragma HLS INTERFACE mode=s_axilite port=b1
	#pragma HLS INTERFACE mode=s_axilite port=b2
	#pragma HLS INTERFACE mode=s_axilite port=b3
	#pragma HLS INTERFACE mode=s_axilite port=b4
	#pragma HLS INTERFACE mode=s_axilite port=b5


    data_t layer1_out[B][L1], layer2_out[B][L2], layer3_out[B][L3];

    // Layer 1
    dense_layer_1(input, layer1_out, w1, b1);
    for (int i = 0; i<B; i++){
		for (int j = 0; i < L1; j++) {
			layer1_out[i][j] = leaky_relu(layer1_out[i][j]);
		}
    }

    // Layer 2
    dense_layer_2(layer1_out, layer2_out, w2, b2);
    for (int i = 0; i<B; i++){
		for (int j = 0; i < L2; j++) {
			layer1_out[i][j] = leaky_relu(layer1_out[i][j]);
		}
    }

    // Layer 3
    dense_layer_3(layer2_out, layer3_out, w3, b3);
    for (int i = 0; i<B; i++){
		for (int j = 0; i < L3; j++) {
			layer1_out[i][j] = leaky_relu(layer1_out[i][j]);
		}
    }

    // Y1 output
    dense_layer_4(layer3_out, y1_output, w4,b4);

    // Y2 output
    dense_layer_4(layer3_out, y2_output, w5, b5);
}

