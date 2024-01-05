/**
*	k-NN
*
*	Versions
*	- v0.1, December 2016
*	- v0.2, November 2019
*	- v0.5, November 2021
*   - v0.6, October 2023
*
*	by Jo�o MP Cardoso
*	Email: jmpc@fe.up.pt
*
*	SPeCS, FEUP.DEI, University of Porto, Portugal
*/

#include <math.h>
#include <stdlib.h>

#ifndef NDEBUG
#define NDEBUG // disable assertions
#endif

#include <assert.h>

#include "nonloop_knn.h"
#include <immintrin.h> // Include AVX2 headers
#include <omp.h>


/**
*  Copy the top k nearest points (first k elements of dist_points) 
*  to a data structure (best_points) with k points
*/
inline void copy_k_nearest(CLASS_ID_TYPE *dist_points_classification_id, DATA_TYPE *distance_dist_points, int num_points,
		CLASS_ID_TYPE *bp_classification_id, DATA_TYPE *bp_distance, int k) {

    for(int i = 0; i < k; i++) {   // we only need the top k minimum distances
       bp_classification_id[i] = dist_points_classification_id[i];
       bp_distance[i] = distance_dist_points[i];
    }

}

/**
*  Get the k nearest points.
*  This version stores the k nearest points in the first k positions of dis_point
*/
void select_k_nearest(CLASS_ID_TYPE *dist_points_classification_id, DATA_TYPE *distance_dist_points, int num_points, int k) {

    DATA_TYPE min_distance, distance_i;
    CLASS_ID_TYPE class_id_1;
    int index;

    for(int i = 0; i < k; i++) {  // we only need the top k minimum distances
      //min_distance = dist_points[i].distance;
      min_distance = distance_dist_points[i];
      index = i;
      for(int j = i+1; j < num_points; j++) {
              if(distance_dist_points[j] < min_distance) {
                  min_distance = distance_dist_points[j];
                  index = j;
              }
      }
      if(index != i) { //swap
         distance_i = distance_dist_points[index];
         class_id_1 = dist_points_classification_id[index];

         distance_dist_points[index] = distance_dist_points[i];
         dist_points_classification_id[index] = dist_points_classification_id[i];

         distance_dist_points[i] = distance_i;
         dist_points_classification_id[i] = class_id_1;
      }
    }
}

 void get_k_NN(Point new_point, DATA_TYPE (*kp_features)[NUM_FEATURES], CLASS_ID_TYPE *kp_classification_id, int num_points,
	CLASS_ID_TYPE *bp_classification_id, DATA_TYPE *bp_distance, int k,  int num_features) {
     
    CLASS_ID_TYPE dist_points_classification_id[num_points];
    DATA_TYPE distance_dist_points[num_points];

    // calculate the Euclidean distance between the Point to classify and each one in the model
    // and update the k best points if needed

    
    for (int i = 0; i < num_points; i++) {
        DATA_TYPE distance = (DATA_TYPE) 0.0;

        // calculate the Euclidean distance
        for (int j = 0; j < num_features; j++) {
            DATA_TYPE diff = (DATA_TYPE) new_point.features[j] - kp_features[i][j];
            distance += diff * diff;
        }
        
       #if(DT == 2)
            distance = sqrtf(distance);
        #else
            distance = sqrt(distance);
        #endif
        
        dist_points_classification_id[i] = kp_classification_id[i];
        distance_dist_points[i] = distance;
    }

    select_k_nearest(dist_points_classification_id, distance_dist_points, num_points, k);
    
    copy_k_nearest(dist_points_classification_id, distance_dist_points, num_points, bp_classification_id, bp_distance, k);
}

/*
*	Classify using the k nearest neighbors identified by the get_k_NN
*	function. The classification uses plurality voting.
*
*	Note: it assumes that classes are identified from 0 to
*	num_classes - 1.
*/
CLASS_ID_TYPE plurality_voting(int k, CLASS_ID_TYPE *bp_classification_id, int num_classes) {
  
    CLASS_ID_TYPE histogram[num_classes];  // maximum is the value of k

    //initialize the histogram
    for (int i = 0; i < num_classes; i++) {
        histogram[i] = 0;
    }

    // build the histogram
    for (int i = 0; i < k; i++) {
        //BestPoint p = best_points[i];

        CLASS_ID_TYPE p_classification_id = bp_classification_id[i];
        //DATA_TYPE p_distance = bp_distance[i];

        //if (best_points[i].distance < min_distance) {
        //    min_distance = best_points[i].distance;
        //}

        assert(p_classification_id != -1);

        histogram[(int) p_classification_id] += 1;
    }

    CLASS_ID_TYPE max = 0; // maximum is k
    CLASS_ID_TYPE classification_id = -1;  // -1 represents an unknown class
    for (int i = 0; i < num_classes; i++) {

        if (histogram[i] > max) {
            max = histogram[i];
            classification_id = (CLASS_ID_TYPE) i;
        }
    }

    return classification_id;
}

/*
* Classify a given Point (instance).
* It returns the classified class ID.
*/
CLASS_ID_TYPE knn_classifyinstance(Point new_point, int k, int num_classes, DATA_TYPE (*kp_features)[NUM_FEATURES], CLASS_ID_TYPE *kp_classification_id, int num_points, int num_features) {

      //BestPoint best_points[k]; // Array with the k nearest points to the Point to classify
      
      CLASS_ID_TYPE bp_classification_id[k];
      DATA_TYPE bp_distance[k];
      
      // calculate the distances of the new point to each of the known points and get
      // the k nearest points
       get_k_NN(new_point, kp_features, kp_classification_id, num_points, bp_classification_id, bp_distance, k, num_features);

	// use plurality voting to return the class inferred for the new point
	CLASS_ID_TYPE classID = plurality_voting(k, bp_classification_id, num_classes);

	return classID;
}