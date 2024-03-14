  SWISH
File
Edit
Examples
Help
366 users online
Search
Login with GoogleLogin with StackOverflow
9650
examples
movies
25
    d. co_star(A1, A2) <- the actor/actress are in the same movie.
26
​
27
*/
28
​
29
/** <examples> (Remove these if you want to give the exercises to students!)
30
​
31
?- movie(american_beauty, Y).
32
?- movie(M, 2000).
33
?- movie(M, Y), Y < 2000.
34
?- movie(M, Y), Y > 1999.
35
?- actor(M1, A, _), actor(M2, A, _), M1 @> M2.
36
?- actress(M, scarlett_johansson, _), director(M, D).
37
?- actor(_, A, _), director(_, A).
38
?- (actor(_, A, _) ; actress(_, A, _)), director(_, A).
39
?- actor(M, john_goodman, _), actor(M, jeff_bridges, _).
40
*/
41
​
42
/* DATABASE
43
​
44
    movie(M, Y) <- movie M came out in year Y
45
    director(M, D) <- movie M was directed by director D
46
    actor(M, A, R) <- actor A played role R in movie M
47
    actress(M, A, R) <- actress A played role R in movie M
48
​
49
*/
50
​
51
:- discontiguous
52
        movie/2,
53
        director/2,
54
        actor/3,
55
        actress/3.
56
​
57
movie(american_beauty, 1999).
58
director(american_beauty, sam_mendes).
59
actor(american_beauty, kevin_spacey, lester_burnham).
60
actress(american_beauty, annette_bening, carolyn_burnham).
61
actress(american_beauty, thora_birch, jane_burnham).
62
actor(american_beauty, wes_bentley, ricky_fitts).
63
actress(american_beauty, mena_suvari, angela_hayes).
64
actor(american_beauty, chris_cooper, col_frank_fitts_usmc).
65
actor(american_beauty, peter_gallagher, buddy_kane).
66
actress(american_beauty, allison_janney, barbara_fitts).
67
actor(american_beauty, scott_bakula, jim_olmeyer).
68
actor(american_beauty, sam_robards, jim_berkley).
69
actor(american_beauty, barry_del_sherman, brad_dupree).
70
actress(american_beauty, ara_celi, sale_house_woman_1).
71
actor(american_beauty, john_cho, sale_house_man_1).
72
actor(american_beauty, fort_atkinson, sale_house_man_2).
73
actress(american_beauty, sue_casey, sale_house_woman_2).
74
actor(american_beauty, kent_faulcon, sale_house_man_3).
75
actress(american_beauty, brenda_wehle, sale_house_woman_4).
76
actress(american_beauty, lisa_cloud, sale_house_woman_5).
77
actress(american_beauty, alison_faulk, spartanette_1).
78
actress(american_beauty, krista_goodsitt, spartanette_2).
79
actress(american_beauty, lily_houtkin, spartanette_3).
80
actress(american_beauty, carolina_lancaster, spartanette_4).
81
actress(american_beauty, romana_leah, spartanette_5).
82
actress(american_beauty, chekeshka_van_putten, spartanette_6).
83
actress(american_beauty, emily_zachary, spartanette_7).
84
actress(american_beauty, nancy_anderson, spartanette_8).
85
actress(american_beauty, reshma_gajjar, spartanette_9).
86
actress(american_beauty, stephanie_rizzo, spartanette_10).
87
actress(american_beauty, heather_joy_sher, playground_girl_1).
88
actress(american_beauty, chelsea_hertford, playground_girl_2).
89
actress(american_beauty, amber_smith, christy_kane).
90
actor(american_beauty, joel_mccrary, catering_boss).
91
actress(american_beauty, marissa_jaret_winokur, mr_smiley_s_counter_girl).
92
actor(american_beauty, dennis_anderson, mr_smiley_s_manager).
93
actor(american_beauty, matthew_kimbrough, firing_range_attendant).
94
actress(american_beauty, erin_cathryn_strubbe, young_jane_burnham).
95
actress(american_beauty, elaine_corral_kendall, newscaster).
96
​
97
movie(anna, 1987).
98
director(anna, yurek_bogayevicz).
99
actress(anna, sally_kirkland, anna).
100
actor(anna, robert_fields, daniel).
101
actress(anna, paulina_porizkova, krystyna).
102
actor(anna, gibby_brand, director_1).
103
actor(anna, john_robert_tillotson, director_2).
104
actress(anna, julianne_gilliam, woman_author).
105
actor(anna, joe_aufiery, stage_manager).
106
actor(anna, lance_davis, assistant_1).

Your query goes here ...
​
?-
 table results