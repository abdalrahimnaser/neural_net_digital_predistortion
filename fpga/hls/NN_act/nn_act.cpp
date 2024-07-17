

#include "nn_act.h"



void nn_act(
		ap_uint<32> params,
		ap_uint<128> sigReIn[BRAM_LEN],
		ap_uint<128> sigImIn[BRAM_LEN],
		ap_uint<128> sigReOut[BRAM_LEN],
		ap_uint<128> sigImOut[BRAM_LEN])
{

#pragma HLS INTERFACE s_axilite port=params bundle=BUS_A
#pragma HLS INTERFACE bram port=sigReIn storage_type=ram_1p
#pragma HLS INTERFACE bram port=sigImIn storage_type=ram_1p
#pragma HLS INTERFACE bram port=sigReOut storage_type=ram_1p
#pragma HLS INTERFACE bram port=sigImOut storage_type=ram_1p


#pragma HLS PIPELINE II=1

	static ap_uint<20> buffIdx = 0;

	ap_uint<20> sigLen;
	ap_int<32> zReTot, zImTot;
	data_128_t  pkt_re_long, pkt_im_long, tmp_re, tmp_im;

	int i;
	ap_uint<128> sigRe, sigIm;


	sigLen = (params & 0xFFFFF);

	tmp_re = 0;
	tmp_im = 0;

	if(sigLen > 0)
	{
		sigRe = sigReIn[buffIdx];
		sigIm = sigImIn[buffIdx];

		for(i=0; i<NUM_AXIS_APP; i++)
		{
			zReTot = (ap_int<32>)((ap_int<16>)((sigRe >> (i*16)) & 0xFFFF));
			zImTot = (ap_int<32>)((ap_int<16>)((sigIm >> (i*16)) & 0xFFFF));
			pkt_re_long = (zReTot & 0xFFFF);
			pkt_im_long = (zImTot & 0xFFFF);
			tmp_re |= (pkt_re_long << (i*16));
			tmp_im |= (pkt_im_long << (i*16));
		}
	}

	sigReOut[buffIdx] = tmp_re;
	sigImOut[buffIdx] = tmp_im;

	if(buffIdx == sigLen)
	{
		buffIdx = 0;
	}
	else
	{
		buffIdx++;
	}


	return;
}

