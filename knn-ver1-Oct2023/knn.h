/**
*	k-NN
*
*	Versions 
*	- v0.1, December 2016
*	- v0.2, November 2019
*	- v0.5, November 2021
*	- v0.6, October 2023
*
*	by Jo�o MP Cardoso
*	Email: jmpc@fe.up.pt
*	
*	SPeCS, FEUP.DEI, University of Porto, Portugal
*/

#ifndef KNN_H
#define KNN_H

#include "params.h"
#include "types.h"


void copy_k_nearest(CLASS_ID_TYPE *dist_points_classification_id, DATA_TYPE *distance_dist_points, int num_points,
		CLASS_ID_TYPE *bp_classification_id, DATA_TYPE *bp_distance, int k);

void select_k_nearest(CLASS_ID_TYPE *dist_points_classification_id, DATA_TYPE *distance_dist_points, int num_points, int k);

void get_k_NN(Point new_point, DATA_TYPE (*kp_features)[NUM_FEATURES], CLASS_ID_TYPE *kp_classification_id, int num_points, CLASS_ID_TYPE *bp_classification_id, DATA_TYPE *bp_distance,
		int k,  int num_features);

CLASS_ID_TYPE plurality_voting(int k, CLASS_ID_TYPE *bp_classification_id, DATA_TYPE *bp_distance, int num_classes);

CLASS_ID_TYPE knn_classifyinstance(Point new_point, int k, int num_classes, Point *known_points, int num_points, int num_features);

#endif
