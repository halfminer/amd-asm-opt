#define KECCAK_REPEAT 1024

#define WORKGROUP 32
__kernel __attribute__((reqd_work_group_size(WORKGROUP, 1, 1))) 
void no_bank_conflicts() {
    #pragma clang loop unroll(disable)
    for (int test = 0; test < KECCAK_REPEAT; test++) {
      __asm__ volatile("v_bfi_b32 v0, v1, v2, v3\n");
      __asm__ volatile("v_bfi_b32 v4, v5, v6, v7\n");
      __asm__ volatile("v_bfi_b32 v8, v9, v10, v11\n");
      __asm__ volatile("v_bfi_b32 v12, v13, v14, v15\n");
      __asm__ volatile("v_bfi_b32 v16, v17, v18, v19\n");
      __asm__ volatile("v_bfi_b32 v20, v21, v22, v23\n");
      __asm__ volatile("v_bfi_b32 v24, v25, v26, v27\n");
      __asm__ volatile("v_bfi_b32 v28, v29, v30, v31\n");
      __asm__ volatile("v_bfi_b32 v32, v33, v34, v35\n");
      __asm__ volatile("v_bfi_b32 v36, v37, v38, v39\n");
      __asm__ volatile("v_bfi_b32 v40, v41, v42, v43\n");
      __asm__ volatile("v_bfi_b32 v44, v45, v46, v47\n");
      __asm__ volatile("v_bfi_b32 v48, v49, v50, v51\n");
      __asm__ volatile("v_bfi_b32 v52, v53, v54, v55\n");
      __asm__ volatile("v_bfi_b32 v56, v57, v58, v59\n");
      __asm__ volatile("v_bfi_b32 v60, v61, v62, v63\n");
      __asm__ volatile("v_bfi_b32 v64, v65, v66, v67\n");
      __asm__ volatile("v_bfi_b32 v68, v69, v70, v71\n");
      __asm__ volatile("v_bfi_b32 v72, v73, v74, v75\n");
      __asm__ volatile("v_bfi_b32 v76, v77, v78, v79\n");
      __asm__ volatile("v_bfi_b32 v80, v81, v82, v83\n");
      __asm__ volatile("v_bfi_b32 v84, v85, v86, v87\n");
      __asm__ volatile("v_bfi_b32 v88, v89, v90, v91\n");
      __asm__ volatile("v_bfi_b32 v92, v93, v94, v95\n");
      __asm__ volatile("v_bfi_b32 v96, v97, v98, v99\n");
      __asm__ volatile("v_bfi_b32 v100, v101, v102, v103\n");
      __asm__ volatile("v_bfi_b32 v104, v105, v106, v107\n");
      __asm__ volatile("v_bfi_b32 v108, v109, v110, v111\n");
      __asm__ volatile("v_bfi_b32 v112, v113, v114, v115\n");
      __asm__ volatile("v_bfi_b32 v116, v117, v118, v119\n");
      __asm__ volatile("v_bfi_b32 v120, v121, v122, v123\n");
      __asm__ volatile("v_bfi_b32 v124, v125, v126, v127\n");
      __asm__ volatile("v_bfi_b32 v128, v129, v130, v131\n");
      __asm__ volatile("v_bfi_b32 v132, v133, v134, v135\n");
      __asm__ volatile("v_bfi_b32 v136, v137, v138, v139\n");
      __asm__ volatile("v_bfi_b32 v140, v141, v142, v143\n");
      __asm__ volatile("v_bfi_b32 v144, v145, v146, v147\n");
      __asm__ volatile("v_bfi_b32 v148, v149, v150, v151\n");
      __asm__ volatile("v_bfi_b32 v152, v153, v154, v155\n");
      __asm__ volatile("v_bfi_b32 v156, v157, v158, v159\n");
      __asm__ volatile("v_bfi_b32 v160, v161, v162, v163\n");
      __asm__ volatile("v_bfi_b32 v164, v165, v166, v167\n");
      __asm__ volatile("v_bfi_b32 v168, v169, v170, v171\n");
      __asm__ volatile("v_bfi_b32 v172, v173, v174, v175\n");
      __asm__ volatile("v_bfi_b32 v176, v177, v178, v179\n");
      __asm__ volatile("v_bfi_b32 v180, v181, v182, v183\n");
      __asm__ volatile("v_bfi_b32 v184, v185, v186, v187\n");
      __asm__ volatile("v_bfi_b32 v188, v189, v190, v191\n");
      __asm__ volatile("v_bfi_b32 v192, v193, v194, v195\n");
      __asm__ volatile("v_bfi_b32 v196, v197, v198, v199\n");
      __asm__ volatile("v_bfi_b32 v200, v201, v202, v203\n");
      __asm__ volatile("v_bfi_b32 v204, v205, v206, v207\n");
      __asm__ volatile("v_bfi_b32 v208, v209, v210, v211\n");
      __asm__ volatile("v_bfi_b32 v212, v213, v214, v215\n");
      __asm__ volatile("v_bfi_b32 v216, v217, v218, v219\n");
      __asm__ volatile("v_bfi_b32 v220, v221, v222, v223\n");
      __asm__ volatile("v_bfi_b32 v224, v225, v226, v227\n");
      __asm__ volatile("v_bfi_b32 v228, v229, v230, v231\n");
      __asm__ volatile("v_bfi_b32 v232, v233, v234, v235\n");
      __asm__ volatile("v_bfi_b32 v236, v237, v238, v239\n");
      __asm__ volatile("v_bfi_b32 v240, v241, v242, v243\n");
      __asm__ volatile("v_bfi_b32 v244, v245, v246, v247\n");
      __asm__ volatile("v_bfi_b32 v248, v249, v250, v251\n");
      __asm__ volatile("v_bfi_b32 v252, v253, v254, v255\n");
    }
}

#define WORKGROUP 32
__kernel __attribute__((reqd_work_group_size(WORKGROUP, 1, 1))) 
void bank_read_conflicts() {
    #pragma clang loop unroll(disable)
    for (int test = 0; test < KECCAK_REPEAT; test++) {
      __asm__ volatile("v_bfi_b32 v0, v4, v8, v12\n");
      __asm__ volatile("v_bfi_b32 v1, v5, v9, v13\n");
      __asm__ volatile("v_bfi_b32 v2, v6, v10, v14\n");
      __asm__ volatile("v_bfi_b32 v3, v7, v11, v15\n");
      __asm__ volatile("v_bfi_b32 v16, v20, v24, v28\n");
      __asm__ volatile("v_bfi_b32 v17, v21, v25, v29\n");
      __asm__ volatile("v_bfi_b32 v18, v22, v26, v30\n");
      __asm__ volatile("v_bfi_b32 v19, v23, v27, v31\n");
      __asm__ volatile("v_bfi_b32 v32, v36, v40, v44\n");
      __asm__ volatile("v_bfi_b32 v33, v37, v41, v45\n");
      __asm__ volatile("v_bfi_b32 v34, v38, v42, v46\n");
      __asm__ volatile("v_bfi_b32 v35, v39, v43, v47\n");
      __asm__ volatile("v_bfi_b32 v48, v52, v56, v60\n");
      __asm__ volatile("v_bfi_b32 v49, v53, v57, v61\n");
      __asm__ volatile("v_bfi_b32 v50, v54, v58, v62\n");
      __asm__ volatile("v_bfi_b32 v51, v55, v59, v63\n");
      __asm__ volatile("v_bfi_b32 v64, v68, v72, v76\n");
      __asm__ volatile("v_bfi_b32 v65, v69, v73, v77\n");
      __asm__ volatile("v_bfi_b32 v66, v70, v74, v78\n");
      __asm__ volatile("v_bfi_b32 v67, v71, v75, v79\n");
      __asm__ volatile("v_bfi_b32 v80, v84, v88, v92\n");
      __asm__ volatile("v_bfi_b32 v81, v85, v89, v93\n");
      __asm__ volatile("v_bfi_b32 v82, v86, v90, v94\n");
      __asm__ volatile("v_bfi_b32 v83, v87, v91, v95\n");
      __asm__ volatile("v_bfi_b32 v96, v100, v104, v108\n");
      __asm__ volatile("v_bfi_b32 v97, v101, v105, v109\n");
      __asm__ volatile("v_bfi_b32 v98, v102, v106, v110\n");
      __asm__ volatile("v_bfi_b32 v99, v103, v107, v111\n");
      __asm__ volatile("v_bfi_b32 v112, v116, v120, v124\n");
      __asm__ volatile("v_bfi_b32 v113, v117, v121, v125\n");
      __asm__ volatile("v_bfi_b32 v114, v118, v122, v126\n");
      __asm__ volatile("v_bfi_b32 v115, v119, v123, v127\n");
      __asm__ volatile("v_bfi_b32 v128, v132, v136, v140\n");
      __asm__ volatile("v_bfi_b32 v129, v133, v137, v141\n");
      __asm__ volatile("v_bfi_b32 v130, v134, v138, v142\n");
      __asm__ volatile("v_bfi_b32 v131, v135, v139, v143\n");
      __asm__ volatile("v_bfi_b32 v144, v148, v152, v156\n");
      __asm__ volatile("v_bfi_b32 v145, v149, v153, v157\n");
      __asm__ volatile("v_bfi_b32 v146, v150, v154, v158\n");
      __asm__ volatile("v_bfi_b32 v147, v151, v155, v159\n");
      __asm__ volatile("v_bfi_b32 v160, v164, v168, v172\n");
      __asm__ volatile("v_bfi_b32 v161, v165, v169, v173\n");
      __asm__ volatile("v_bfi_b32 v162, v166, v170, v174\n");
      __asm__ volatile("v_bfi_b32 v163, v167, v171, v175\n");
      __asm__ volatile("v_bfi_b32 v176, v180, v184, v188\n");
      __asm__ volatile("v_bfi_b32 v177, v181, v185, v189\n");
      __asm__ volatile("v_bfi_b32 v178, v182, v186, v190\n");
      __asm__ volatile("v_bfi_b32 v179, v183, v187, v191\n");
      __asm__ volatile("v_bfi_b32 v192, v196, v200, v204\n");
      __asm__ volatile("v_bfi_b32 v193, v197, v201, v205\n");
      __asm__ volatile("v_bfi_b32 v194, v198, v202, v206\n");
      __asm__ volatile("v_bfi_b32 v195, v199, v203, v207\n");
      __asm__ volatile("v_bfi_b32 v208, v212, v216, v220\n");
      __asm__ volatile("v_bfi_b32 v209, v213, v217, v221\n");
      __asm__ volatile("v_bfi_b32 v210, v214, v218, v222\n");
      __asm__ volatile("v_bfi_b32 v211, v215, v219, v223\n");
      __asm__ volatile("v_bfi_b32 v224, v228, v232, v236\n");
      __asm__ volatile("v_bfi_b32 v225, v229, v233, v237\n");
      __asm__ volatile("v_bfi_b32 v226, v230, v234, v238\n");
      __asm__ volatile("v_bfi_b32 v227, v231, v235, v239\n");
      __asm__ volatile("v_bfi_b32 v240, v244, v248, v252\n");
      __asm__ volatile("v_bfi_b32 v241, v245, v249, v253\n");
      __asm__ volatile("v_bfi_b32 v242, v246, v250, v254\n");
      __asm__ volatile("v_bfi_b32 v243, v247, v251, v255\n");
    }
}

#define WORKGROUP 32
__kernel __attribute__((reqd_work_group_size(WORKGROUP, 1, 1))) 
void bank_read_and_write_conflict() {
    #pragma clang loop unroll(disable)
    for (int test = 0; test < KECCAK_REPEAT; test++) {
      __asm__ volatile("v_bfi_b32 v64, v64, v72, v76\n");
      __asm__ volatile("v_bfi_b32 v65, v65, v73, v77\n");
      __asm__ volatile("v_bfi_b32 v66, v66, v74, v78\n");
      __asm__ volatile("v_bfi_b32 v67, v67, v75, v79\n");
      __asm__ volatile("v_bfi_b32 v80, v80, v88, v92\n");
      __asm__ volatile("v_bfi_b32 v81, v81, v89, v93\n");
      __asm__ volatile("v_bfi_b32 v163, v163, v171, v175\n");
      __asm__ volatile("v_bfi_b32 v176, v176, v184, v188\n");
      __asm__ volatile("v_bfi_b32 v177, v177, v185, v189\n");
      __asm__ volatile("v_bfi_b32 v178, v178, v186, v190\n");
      __asm__ volatile("v_bfi_b32 v179, v179, v187, v191\n");
      __asm__ volatile("v_bfi_b32 v192, v192, v200, v204\n");
      __asm__ volatile("v_bfi_b32 v193, v193, v201, v205\n");
      __asm__ volatile("v_bfi_b32 v194, v194, v202, v206\n");
      __asm__ volatile("v_bfi_b32 v195, v195, v203, v207\n");
      __asm__ volatile("v_bfi_b32 v208, v208, v216, v220\n");
      __asm__ volatile("v_bfi_b32 v209, v209, v217, v221\n");
      __asm__ volatile("v_bfi_b32 v210, v210, v218, v222\n");
      __asm__ volatile("v_bfi_b32 v211, v211, v219, v223\n");
      __asm__ volatile("v_bfi_b32 v224, v224, v232, v236\n");
      __asm__ volatile("v_bfi_b32 v82, v82, v90, v94\n");
      __asm__ volatile("v_bfi_b32 v83, v83, v91, v95\n");
      __asm__ volatile("v_bfi_b32 v96, v96, v104, v108\n");
      __asm__ volatile("v_bfi_b32 v97, v97, v105, v109\n");
      __asm__ volatile("v_bfi_b32 v98, v98, v106, v110\n");
      __asm__ volatile("v_bfi_b32 v99, v99, v107, v111\n");
      __asm__ volatile("v_bfi_b32 v112, v112, v120, v124\n");
      __asm__ volatile("v_bfi_b32 v113, v113, v121, v125\n");
      __asm__ volatile("v_bfi_b32 v114, v114, v122, v126\n");
      __asm__ volatile("v_bfi_b32 v115, v115, v123, v127\n");
      __asm__ volatile("v_bfi_b32 v128, v128, v136, v140\n");
      __asm__ volatile("v_bfi_b32 v129, v129, v137, v141\n");
      __asm__ volatile("v_bfi_b32 v130, v130, v138, v142\n");
      __asm__ volatile("v_bfi_b32 v0, v0, v8, v12\n");
      __asm__ volatile("v_bfi_b32 v131, v131, v139, v143\n");
      __asm__ volatile("v_bfi_b32 v144, v144, v152, v156\n");
      __asm__ volatile("v_bfi_b32 v145, v145, v153, v157\n");
      __asm__ volatile("v_bfi_b32 v146, v146, v154, v158\n");
      __asm__ volatile("v_bfi_b32 v147, v147, v155, v159\n");
      __asm__ volatile("v_bfi_b32 v160, v160, v168, v172\n");
      __asm__ volatile("v_bfi_b32 v161, v161, v169, v173\n");
      __asm__ volatile("v_bfi_b32 v162, v162, v170, v174\n");
      __asm__ volatile("v_bfi_b32 v225, v225, v233, v237\n");
      __asm__ volatile("v_bfi_b32 v226, v226, v234, v238\n");
      __asm__ volatile("v_bfi_b32 v1, v1, v9, v13\n");
      __asm__ volatile("v_bfi_b32 v2, v2, v10, v14\n");
      __asm__ volatile("v_bfi_b32 v3, v3, v11, v15\n");
      __asm__ volatile("v_bfi_b32 v16, v16, v24, v28\n");
      __asm__ volatile("v_bfi_b32 v17, v17, v25, v29\n");
      __asm__ volatile("v_bfi_b32 v18, v18, v26, v30\n");
      __asm__ volatile("v_bfi_b32 v19, v19, v27, v31\n");
      __asm__ volatile("v_bfi_b32 v32, v32, v40, v44\n");
      __asm__ volatile("v_bfi_b32 v33, v33, v41, v45\n");
      __asm__ volatile("v_bfi_b32 v34, v34, v42, v46\n");
      __asm__ volatile("v_bfi_b32 v35, v35, v43, v47\n");
      __asm__ volatile("v_bfi_b32 v48, v48, v56, v60\n");
      __asm__ volatile("v_bfi_b32 v49, v49, v57, v61\n");
      __asm__ volatile("v_bfi_b32 v50, v50, v58, v62\n");
      __asm__ volatile("v_bfi_b32 v51, v51, v59, v63\n");
      __asm__ volatile("v_bfi_b32 v227, v227, v235, v239\n");
      __asm__ volatile("v_bfi_b32 v240, v240, v248, v252\n");
      __asm__ volatile("v_bfi_b32 v241, v241, v249, v253\n");
      __asm__ volatile("v_bfi_b32 v242, v242, v250, v254\n");
      __asm__ volatile("v_bfi_b32 v243, v243, v251, v255\n");
    }
}

#define WORKGROUP 32
__kernel __attribute__((reqd_work_group_size(WORKGROUP, 1, 1))) 
void bank_conflict1_read_write() {
    #pragma clang loop unroll(disable)
    for (int test = 0; test < KECCAK_REPEAT; test++) {
      __asm__ volatile("v_bfi_b32 v0, v1, v2, v4\n");
      __asm__ volatile("v_bfi_b32 v3, v5, v6, v7\n");
      __asm__ volatile("v_bfi_b32 v8, v9, v10, v12\n");
      __asm__ volatile("v_bfi_b32 v11, v13, v14, v15\n");
      __asm__ volatile("v_bfi_b32 v16, v17, v18, v20\n");
      __asm__ volatile("v_bfi_b32 v19, v21, v22, v23\n");
      __asm__ volatile("v_bfi_b32 v24, v25, v26, v28\n");
      __asm__ volatile("v_bfi_b32 v27, v29, v30, v31\n");
      __asm__ volatile("v_bfi_b32 v32, v33, v34, v36\n");
      __asm__ volatile("v_bfi_b32 v35, v37, v38, v39\n");
      __asm__ volatile("v_bfi_b32 v40, v41, v42, v42\n");
      __asm__ volatile("v_bfi_b32 v43, v45, v46, v47\n");
      __asm__ volatile("v_bfi_b32 v48, v49, v50, v52\n");
      __asm__ volatile("v_bfi_b32 v51, v53, v54, v55\n");
      __asm__ volatile("v_bfi_b32 v56, v57, v58, v60\n");
      __asm__ volatile("v_bfi_b32 v59, v61, v62, v63\n");
      __asm__ volatile("v_bfi_b32 v64, v65, v66, v68\n");
      __asm__ volatile("v_bfi_b32 v67, v69, v70, v71\n");
      __asm__ volatile("v_bfi_b32 v72, v73, v74, v76\n");
      __asm__ volatile("v_bfi_b32 v75, v77, v78, v79\n");
      __asm__ volatile("v_bfi_b32 v80, v81, v82, v84\n");
      __asm__ volatile("v_bfi_b32 v83, v85, v86, v87\n");
      __asm__ volatile("v_bfi_b32 v88, v89, v90, v92\n");
      __asm__ volatile("v_bfi_b32 v91, v93, v94, v95\n");
      __asm__ volatile("v_bfi_b32 v96, v97, v98, v100\n");
      __asm__ volatile("v_bfi_b32 v99, v101, v102, v103\n");
      __asm__ volatile("v_bfi_b32 v104, v105, v106, v108\n");
      __asm__ volatile("v_bfi_b32 v107, v109, v110, v111\n");
      __asm__ volatile("v_bfi_b32 v112, v113, v114, v116\n");
      __asm__ volatile("v_bfi_b32 v115, v117, v118, v119\n");
      __asm__ volatile("v_bfi_b32 v120, v121, v122, v124\n");
      __asm__ volatile("v_bfi_b32 v123, v125, v126, v127\n");
      __asm__ volatile("v_bfi_b32 v128, v129, v130, v132\n");
      __asm__ volatile("v_bfi_b32 v131, v133, v134, v135\n");
      __asm__ volatile("v_bfi_b32 v136, v137, v138, v140\n");
      __asm__ volatile("v_bfi_b32 v139, v141, v142, v143\n");
      __asm__ volatile("v_bfi_b32 v144, v145, v146, v148\n");
      __asm__ volatile("v_bfi_b32 v147, v149, v150, v151\n");
      __asm__ volatile("v_bfi_b32 v152, v153, v154, v156\n");
      __asm__ volatile("v_bfi_b32 v155, v157, v158, v159\n");
      __asm__ volatile("v_bfi_b32 v160, v161, v162, v164\n");
      __asm__ volatile("v_bfi_b32 v163, v165, v166, v167\n");
      __asm__ volatile("v_bfi_b32 v168, v169, v170, v172\n");
      __asm__ volatile("v_bfi_b32 v171, v173, v174, v175\n");
      __asm__ volatile("v_bfi_b32 v176, v177, v178, v180\n");
      __asm__ volatile("v_bfi_b32 v179, v181, v182, v183\n");
      __asm__ volatile("v_bfi_b32 v184, v185, v186, v188\n");
      __asm__ volatile("v_bfi_b32 v187, v189, v190, v191\n");
      __asm__ volatile("v_bfi_b32 v192, v193, v194, v196\n");
      __asm__ volatile("v_bfi_b32 v195, v197, v198, v199\n");
      __asm__ volatile("v_bfi_b32 v200, v201, v202, v204\n");
      __asm__ volatile("v_bfi_b32 v203, v205, v206, v207\n");
      __asm__ volatile("v_bfi_b32 v208, v209, v210, v212\n");
      __asm__ volatile("v_bfi_b32 v211, v213, v214, v215\n");
      __asm__ volatile("v_bfi_b32 v216, v217, v218, v220\n");
      __asm__ volatile("v_bfi_b32 v219, v221, v222, v223\n");
      __asm__ volatile("v_bfi_b32 v224, v225, v226, v228\n");
      __asm__ volatile("v_bfi_b32 v227, v229, v230, v231\n");
      __asm__ volatile("v_bfi_b32 v232, v233, v234, v236\n");
      __asm__ volatile("v_bfi_b32 v235, v237, v238, v239\n");
      __asm__ volatile("v_bfi_b32 v240, v241, v242, v244\n");
      __asm__ volatile("v_bfi_b32 v243, v245, v246, v247\n");
      __asm__ volatile("v_bfi_b32 v248, v249, v250, v252\n");
      __asm__ volatile("v_bfi_b32 v251, v253, v254, v255\n");
    }
}

#define WORKGROUP 32
__kernel __attribute__((reqd_work_group_size(WORKGROUP, 1, 1))) 
void bank_conflict1_read() {
    #pragma clang loop unroll(disable)
    for (int test = 0; test < KECCAK_REPEAT; test++) {
      __asm__ volatile("v_bfi_b32 v0, v1, v2, v5\n");
      __asm__ volatile("v_bfi_b32 v4, v3, v6, v7\n");
      __asm__ volatile("v_bfi_b32 v8, v9, v10, v13\n");
      __asm__ volatile("v_bfi_b32 v12, v11, v14, v15\n");
      __asm__ volatile("v_bfi_b32 v16, v17, v18, v21\n");
      __asm__ volatile("v_bfi_b32 v20, v19, v22, v23\n");
      __asm__ volatile("v_bfi_b32 v24, v25, v26, v29\n");
      __asm__ volatile("v_bfi_b32 v28, v27, v30, v31\n");
      __asm__ volatile("v_bfi_b32 v32, v33, v34, v37\n");
      __asm__ volatile("v_bfi_b32 v36, v35, v38, v39\n");
      __asm__ volatile("v_bfi_b32 v40, v41, v42, v45\n");
      __asm__ volatile("v_bfi_b32 v44, v43, v46, v47\n");
      __asm__ volatile("v_bfi_b32 v48, v49, v50, v53\n");
      __asm__ volatile("v_bfi_b32 v52, v51, v54, v55\n");
      __asm__ volatile("v_bfi_b32 v56, v57, v58, v61\n");
      __asm__ volatile("v_bfi_b32 v60, v59, v62, v63\n");
      __asm__ volatile("v_bfi_b32 v64, v65, v66, v69\n");
      __asm__ volatile("v_bfi_b32 v68, v67, v70, v71\n");
      __asm__ volatile("v_bfi_b32 v72, v73, v74, v77\n");
      __asm__ volatile("v_bfi_b32 v76, v75, v78, v79\n");
      __asm__ volatile("v_bfi_b32 v80, v81, v82, v85\n");
      __asm__ volatile("v_bfi_b32 v84, v83, v86, v87\n");
      __asm__ volatile("v_bfi_b32 v88, v89, v90, v93\n");
      __asm__ volatile("v_bfi_b32 v92, v91, v94, v95\n");
      __asm__ volatile("v_bfi_b32 v96, v97, v98, v101\n");
      __asm__ volatile("v_bfi_b32 v100, v99, v102, v103\n");
      __asm__ volatile("v_bfi_b32 v104, v105, v106, v109\n");
      __asm__ volatile("v_bfi_b32 v108, v107, v110, v111\n");
      __asm__ volatile("v_bfi_b32 v112, v113, v114, v117\n");
      __asm__ volatile("v_bfi_b32 v116, v115, v118, v119\n");
      __asm__ volatile("v_bfi_b32 v120, v121, v122, v125\n");
      __asm__ volatile("v_bfi_b32 v124, v123, v126, v127\n");
      __asm__ volatile("v_bfi_b32 v128, v129, v130, v133\n");
      __asm__ volatile("v_bfi_b32 v132, v131, v134, v135\n");
      __asm__ volatile("v_bfi_b32 v136, v137, v138, v141\n");
      __asm__ volatile("v_bfi_b32 v140, v139, v142, v143\n");
      __asm__ volatile("v_bfi_b32 v144, v145, v146, v149\n");
      __asm__ volatile("v_bfi_b32 v148, v147, v150, v151\n");
      __asm__ volatile("v_bfi_b32 v152, v153, v154, v157\n");
      __asm__ volatile("v_bfi_b32 v156, v155, v158, v159\n");
      __asm__ volatile("v_bfi_b32 v160, v161, v162, v165\n");
      __asm__ volatile("v_bfi_b32 v164, v163, v166, v167\n");
      __asm__ volatile("v_bfi_b32 v168, v169, v170, v173\n");
      __asm__ volatile("v_bfi_b32 v172, v171, v174, v175\n");
      __asm__ volatile("v_bfi_b32 v176, v177, v178, v181\n");
      __asm__ volatile("v_bfi_b32 v180, v179, v182, v183\n");
      __asm__ volatile("v_bfi_b32 v184, v185, v186, v189\n");
      __asm__ volatile("v_bfi_b32 v188, v187, v190, v191\n");
      __asm__ volatile("v_bfi_b32 v192, v193, v194, v197\n");
      __asm__ volatile("v_bfi_b32 v196, v195, v198, v199\n");
      __asm__ volatile("v_bfi_b32 v200, v201, v202, v205\n");
      __asm__ volatile("v_bfi_b32 v204, v203, v206, v207\n");
      __asm__ volatile("v_bfi_b32 v208, v209, v210, v213\n");
      __asm__ volatile("v_bfi_b32 v212, v211, v214, v215\n");
      __asm__ volatile("v_bfi_b32 v216, v217, v218, v221\n");
      __asm__ volatile("v_bfi_b32 v220, v219, v222, v223\n");
      __asm__ volatile("v_bfi_b32 v224, v225, v226, v229\n");
      __asm__ volatile("v_bfi_b32 v228, v227, v230, v231\n");
      __asm__ volatile("v_bfi_b32 v232, v233, v234, v237\n");
      __asm__ volatile("v_bfi_b32 v236, v235, v238, v239\n");
      __asm__ volatile("v_bfi_b32 v240, v241, v242, v245\n");
      __asm__ volatile("v_bfi_b32 v244, v243, v246, v247\n");
      __asm__ volatile("v_bfi_b32 v248, v249, v250, v253\n");
      __asm__ volatile("v_bfi_b32 v252, v251, v254, v255\n");
    }
}