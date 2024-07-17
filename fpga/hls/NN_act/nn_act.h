/*
 * Copyright 2022 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <iostream>
using namespace std;

#include "hls_stream.h"
#include "ap_axi_sdata.h"

#include "ap_int.h"

#define SIM_ENV



#define TX_MODE_OFF (0)
#define TX_MODE_ONE_SHOT (1)
#define TX_MODE_PERIODIC (2)




#ifdef SIM_ENV
#define BRAM_LEN  (1024)
#define BRAM_DIG_OUT_LEN (1024)
#define BRAM_PAR_LEN (1024)
#else
#define BRAM_LEN  (32768)
#define BRAM_DIG_OUT_LEN ((BRAM_LEN*DIG_BITS)/32)
#define BRAM_PAR_LEN (64)
#endif

#define IRQ_LEN (1 << 4)

#define DIG_BITS (2)
#define SIG_BITS (15)

#define NUM_AXIS_APP (8)

#define DATAWIDTH (32*NUM_AXIS_APP)

typedef ap_uint<(16*NUM_AXIS_APP)> data_128_t;
typedef hls::axis<data_128_t, 0, 0, 0> pkt_128;


typedef ap_uint<DATAWIDTH> data_t;

typedef hls::axis<data_t, 0, 0, 0>  pkt;

typedef hls::axis<ap_uint<8>, 0, 0, 0>  pkt_b;

typedef ap_uint<32> d_coeff_m_axi_t;
typedef ap_uint<32> d_coeff_t;

typedef ap_uint<1> d_bool;




void nn_act(
		ap_uint<32> params,
		ap_uint<128> sigReIn[BRAM_LEN],
		ap_uint<128> sigImIn[BRAM_LEN],
		ap_uint<128> sigReOut[BRAM_LEN],
		ap_uint<128> sigImOut[BRAM_LEN]);






