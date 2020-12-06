                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module suelo
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_suelo
                             12 	.globl _main_pal0
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 	.area _CODE
   7204                      45 _main_pal0:
   7204 54                   46 	.db #0x54	; 84	'T'
   7205 44                   47 	.db #0x44	; 68	'D'
   7206 5C                   48 	.db #0x5c	; 92
   7207 58                   49 	.db #0x58	; 88	'X'
   7208 45                   50 	.db #0x45	; 69	'E'
   7209 52                   51 	.db #0x52	; 82	'R'
   720A 46                   52 	.db #0x46	; 70	'F'
   720B 5E                   53 	.db #0x5e	; 94
   720C 40                   54 	.db #0x40	; 64
   720D 47                   55 	.db #0x47	; 71	'G'
   720E 42                   56 	.db #0x42	; 66	'B'
   720F 53                   57 	.db #0x53	; 83	'S'
   7210 5A                   58 	.db #0x5a	; 90	'Z'
   7211 4A                   59 	.db #0x4a	; 74	'J'
   7212 43                   60 	.db #0x43	; 67	'C'
   7213 4B                   61 	.db #0x4b	; 75	'K'
   7214                      62 _sp_suelo:
   7214 FF                   63 	.db #0xff	; 255
   7215 FF                   64 	.db #0xff	; 255
   7216 FF                   65 	.db #0xff	; 255
   7217 FF                   66 	.db #0xff	; 255
   7218 FF                   67 	.db #0xff	; 255
   7219 FF                   68 	.db #0xff	; 255
   721A FF                   69 	.db #0xff	; 255
   721B FF                   70 	.db #0xff	; 255
   721C FF                   71 	.db #0xff	; 255
   721D FF                   72 	.db #0xff	; 255
   721E FF                   73 	.db #0xff	; 255
   721F FF                   74 	.db #0xff	; 255
   7220 FF                   75 	.db #0xff	; 255
   7221 FF                   76 	.db #0xff	; 255
   7222 FF                   77 	.db #0xff	; 255
   7223 FF                   78 	.db #0xff	; 255
   7224 FF                   79 	.db #0xff	; 255
   7225 FF                   80 	.db #0xff	; 255
   7226 FF                   81 	.db #0xff	; 255
   7227 FF                   82 	.db #0xff	; 255
   7228 FF                   83 	.db #0xff	; 255
   7229 FF                   84 	.db #0xff	; 255
   722A FF                   85 	.db #0xff	; 255
   722B FF                   86 	.db #0xff	; 255
   722C FF                   87 	.db #0xff	; 255
   722D FF                   88 	.db #0xff	; 255
   722E FF                   89 	.db #0xff	; 255
   722F FF                   90 	.db #0xff	; 255
   7230 FF                   91 	.db #0xff	; 255
   7231 FF                   92 	.db #0xff	; 255
   7232 FF                   93 	.db #0xff	; 255
   7233 FF                   94 	.db #0xff	; 255
   7234 FF                   95 	.db #0xff	; 255
   7235 FF                   96 	.db #0xff	; 255
   7236 FF                   97 	.db #0xff	; 255
   7237 FF                   98 	.db #0xff	; 255
   7238 FF                   99 	.db #0xff	; 255
   7239 FF                  100 	.db #0xff	; 255
   723A FF                  101 	.db #0xff	; 255
   723B FF                  102 	.db #0xff	; 255
   723C FF                  103 	.db #0xff	; 255
   723D FF                  104 	.db #0xff	; 255
   723E FF                  105 	.db #0xff	; 255
   723F FF                  106 	.db #0xff	; 255
   7240 FF                  107 	.db #0xff	; 255
   7241 FF                  108 	.db #0xff	; 255
   7242 FF                  109 	.db #0xff	; 255
   7243 FF                  110 	.db #0xff	; 255
   7244 FF                  111 	.db #0xff	; 255
   7245 FF                  112 	.db #0xff	; 255
   7246 FF                  113 	.db #0xff	; 255
   7247 FF                  114 	.db #0xff	; 255
   7248 FF                  115 	.db #0xff	; 255
   7249 FF                  116 	.db #0xff	; 255
   724A FF                  117 	.db #0xff	; 255
   724B FF                  118 	.db #0xff	; 255
   724C FF                  119 	.db #0xff	; 255
   724D FF                  120 	.db #0xff	; 255
   724E FF                  121 	.db #0xff	; 255
   724F FF                  122 	.db #0xff	; 255
   7250 FF                  123 	.db #0xff	; 255
   7251 FF                  124 	.db #0xff	; 255
   7252 FF                  125 	.db #0xff	; 255
   7253 FF                  126 	.db #0xff	; 255
   7254 FF                  127 	.db #0xff	; 255
   7255 FF                  128 	.db #0xff	; 255
   7256 FF                  129 	.db #0xff	; 255
   7257 FF                  130 	.db #0xff	; 255
   7258 FF                  131 	.db #0xff	; 255
   7259 FF                  132 	.db #0xff	; 255
   725A FF                  133 	.db #0xff	; 255
   725B FF                  134 	.db #0xff	; 255
   725C FF                  135 	.db #0xff	; 255
   725D FF                  136 	.db #0xff	; 255
   725E FF                  137 	.db #0xff	; 255
   725F FF                  138 	.db #0xff	; 255
   7260 FF                  139 	.db #0xff	; 255
   7261 FF                  140 	.db #0xff	; 255
   7262 FF                  141 	.db #0xff	; 255
   7263 FF                  142 	.db #0xff	; 255
   7264 FF                  143 	.db #0xff	; 255
   7265 FF                  144 	.db #0xff	; 255
   7266 FF                  145 	.db #0xff	; 255
   7267 FF                  146 	.db #0xff	; 255
   7268 FF                  147 	.db #0xff	; 255
   7269 FF                  148 	.db #0xff	; 255
   726A FF                  149 	.db #0xff	; 255
   726B FF                  150 	.db #0xff	; 255
   726C FF                  151 	.db #0xff	; 255
   726D FF                  152 	.db #0xff	; 255
   726E FF                  153 	.db #0xff	; 255
   726F FF                  154 	.db #0xff	; 255
   7270 FF                  155 	.db #0xff	; 255
   7271 FF                  156 	.db #0xff	; 255
   7272 FF                  157 	.db #0xff	; 255
   7273 FF                  158 	.db #0xff	; 255
   7274 FF                  159 	.db #0xff	; 255
   7275 FF                  160 	.db #0xff	; 255
   7276 FF                  161 	.db #0xff	; 255
   7277 FF                  162 	.db #0xff	; 255
   7278 FF                  163 	.db #0xff	; 255
   7279 FF                  164 	.db #0xff	; 255
   727A FF                  165 	.db #0xff	; 255
   727B FF                  166 	.db #0xff	; 255
   727C FF                  167 	.db #0xff	; 255
   727D FF                  168 	.db #0xff	; 255
   727E FF                  169 	.db #0xff	; 255
   727F FF                  170 	.db #0xff	; 255
   7280 FF                  171 	.db #0xff	; 255
   7281 FF                  172 	.db #0xff	; 255
   7282 FF                  173 	.db #0xff	; 255
   7283 FF                  174 	.db #0xff	; 255
   7284 FF                  175 	.db #0xff	; 255
   7285 FF                  176 	.db #0xff	; 255
   7286 FF                  177 	.db #0xff	; 255
   7287 FF                  178 	.db #0xff	; 255
   7288 FF                  179 	.db #0xff	; 255
   7289 FF                  180 	.db #0xff	; 255
   728A FF                  181 	.db #0xff	; 255
   728B FF                  182 	.db #0xff	; 255
   728C FF                  183 	.db #0xff	; 255
   728D FF                  184 	.db #0xff	; 255
   728E FF                  185 	.db #0xff	; 255
   728F FF                  186 	.db #0xff	; 255
   7290 FF                  187 	.db #0xff	; 255
   7291 FF                  188 	.db #0xff	; 255
   7292 FF                  189 	.db #0xff	; 255
   7293 FF                  190 	.db #0xff	; 255
   7294 FF                  191 	.db #0xff	; 255
   7295 FF                  192 	.db #0xff	; 255
   7296 FF                  193 	.db #0xff	; 255
   7297 FF                  194 	.db #0xff	; 255
   7298 FF                  195 	.db #0xff	; 255
   7299 FF                  196 	.db #0xff	; 255
   729A FF                  197 	.db #0xff	; 255
   729B FF                  198 	.db #0xff	; 255
   729C FF                  199 	.db #0xff	; 255
   729D FF                  200 	.db #0xff	; 255
   729E FF                  201 	.db #0xff	; 255
   729F FF                  202 	.db #0xff	; 255
   72A0 FF                  203 	.db #0xff	; 255
   72A1 FF                  204 	.db #0xff	; 255
   72A2 FF                  205 	.db #0xff	; 255
   72A3 FF                  206 	.db #0xff	; 255
   72A4 FF                  207 	.db #0xff	; 255
   72A5 FF                  208 	.db #0xff	; 255
   72A6 FF                  209 	.db #0xff	; 255
   72A7 FF                  210 	.db #0xff	; 255
   72A8 FF                  211 	.db #0xff	; 255
   72A9 FF                  212 	.db #0xff	; 255
   72AA FF                  213 	.db #0xff	; 255
   72AB FF                  214 	.db #0xff	; 255
   72AC FF                  215 	.db #0xff	; 255
   72AD FF                  216 	.db #0xff	; 255
   72AE FF                  217 	.db #0xff	; 255
   72AF FF                  218 	.db #0xff	; 255
   72B0 FF                  219 	.db #0xff	; 255
   72B1 FF                  220 	.db #0xff	; 255
   72B2 FF                  221 	.db #0xff	; 255
   72B3 FF                  222 	.db #0xff	; 255
   72B4 FF                  223 	.db #0xff	; 255
   72B5 FF                  224 	.db #0xff	; 255
   72B6 FF                  225 	.db #0xff	; 255
   72B7 FF                  226 	.db #0xff	; 255
   72B8 FF                  227 	.db #0xff	; 255
   72B9 FF                  228 	.db #0xff	; 255
   72BA FF                  229 	.db #0xff	; 255
   72BB FF                  230 	.db #0xff	; 255
   72BC FF                  231 	.db #0xff	; 255
   72BD FF                  232 	.db #0xff	; 255
   72BE FF                  233 	.db #0xff	; 255
   72BF FF                  234 	.db #0xff	; 255
   72C0 FF                  235 	.db #0xff	; 255
   72C1 FF                  236 	.db #0xff	; 255
   72C2 FF                  237 	.db #0xff	; 255
   72C3 FF                  238 	.db #0xff	; 255
   72C4 FF                  239 	.db #0xff	; 255
   72C5 FF                  240 	.db #0xff	; 255
   72C6 FF                  241 	.db #0xff	; 255
   72C7 FF                  242 	.db #0xff	; 255
   72C8 FF                  243 	.db #0xff	; 255
   72C9 FF                  244 	.db #0xff	; 255
   72CA FF                  245 	.db #0xff	; 255
   72CB FF                  246 	.db #0xff	; 255
   72CC FF                  247 	.db #0xff	; 255
   72CD FF                  248 	.db #0xff	; 255
   72CE FF                  249 	.db #0xff	; 255
   72CF FF                  250 	.db #0xff	; 255
   72D0 FF                  251 	.db #0xff	; 255
   72D1 FF                  252 	.db #0xff	; 255
   72D2 FF                  253 	.db #0xff	; 255
   72D3 FF                  254 	.db #0xff	; 255
   72D4 FF                  255 	.db #0xff	; 255
   72D5 FF                  256 	.db #0xff	; 255
   72D6 FF                  257 	.db #0xff	; 255
   72D7 FF                  258 	.db #0xff	; 255
   72D8 FF                  259 	.db #0xff	; 255
   72D9 FF                  260 	.db #0xff	; 255
   72DA FF                  261 	.db #0xff	; 255
   72DB FF                  262 	.db #0xff	; 255
   72DC FF                  263 	.db #0xff	; 255
   72DD FF                  264 	.db #0xff	; 255
   72DE FF                  265 	.db #0xff	; 255
   72DF FF                  266 	.db #0xff	; 255
   72E0 FF                  267 	.db #0xff	; 255
   72E1 FF                  268 	.db #0xff	; 255
   72E2 FF                  269 	.db #0xff	; 255
   72E3 FF                  270 	.db #0xff	; 255
   72E4 FF                  271 	.db #0xff	; 255
   72E5 FF                  272 	.db #0xff	; 255
   72E6 FF                  273 	.db #0xff	; 255
   72E7 FF                  274 	.db #0xff	; 255
   72E8 FF                  275 	.db #0xff	; 255
   72E9 FF                  276 	.db #0xff	; 255
   72EA FF                  277 	.db #0xff	; 255
   72EB FF                  278 	.db #0xff	; 255
   72EC FF                  279 	.db #0xff	; 255
   72ED FF                  280 	.db #0xff	; 255
   72EE FF                  281 	.db #0xff	; 255
   72EF FF                  282 	.db #0xff	; 255
   72F0 FF                  283 	.db #0xff	; 255
   72F1 FF                  284 	.db #0xff	; 255
   72F2 FF                  285 	.db #0xff	; 255
   72F3 FF                  286 	.db #0xff	; 255
   72F4 FF                  287 	.db #0xff	; 255
   72F5 FF                  288 	.db #0xff	; 255
   72F6 FF                  289 	.db #0xff	; 255
   72F7 FF                  290 	.db #0xff	; 255
   72F8 FF                  291 	.db #0xff	; 255
   72F9 FF                  292 	.db #0xff	; 255
   72FA FF                  293 	.db #0xff	; 255
   72FB FF                  294 	.db #0xff	; 255
   72FC FF                  295 	.db #0xff	; 255
   72FD FF                  296 	.db #0xff	; 255
   72FE FF                  297 	.db #0xff	; 255
   72FF FF                  298 	.db #0xff	; 255
   7300 FF                  299 	.db #0xff	; 255
   7301 FF                  300 	.db #0xff	; 255
   7302 FF                  301 	.db #0xff	; 255
   7303 FF                  302 	.db #0xff	; 255
   7304 FF                  303 	.db #0xff	; 255
   7305 FF                  304 	.db #0xff	; 255
   7306 FF                  305 	.db #0xff	; 255
   7307 FF                  306 	.db #0xff	; 255
   7308 FF                  307 	.db #0xff	; 255
   7309 FF                  308 	.db #0xff	; 255
   730A FF                  309 	.db #0xff	; 255
   730B FF                  310 	.db #0xff	; 255
   730C FF                  311 	.db #0xff	; 255
   730D FF                  312 	.db #0xff	; 255
   730E FF                  313 	.db #0xff	; 255
   730F FF                  314 	.db #0xff	; 255
   7310 FF                  315 	.db #0xff	; 255
   7311 FF                  316 	.db #0xff	; 255
   7312 FF                  317 	.db #0xff	; 255
   7313 FF                  318 	.db #0xff	; 255
   7314 FF                  319 	.db #0xff	; 255
   7315 FF                  320 	.db #0xff	; 255
   7316 FF                  321 	.db #0xff	; 255
   7317 FF                  322 	.db #0xff	; 255
   7318 FF                  323 	.db #0xff	; 255
   7319 FF                  324 	.db #0xff	; 255
   731A FF                  325 	.db #0xff	; 255
   731B FF                  326 	.db #0xff	; 255
   731C FF                  327 	.db #0xff	; 255
   731D FF                  328 	.db #0xff	; 255
   731E FF                  329 	.db #0xff	; 255
   731F FF                  330 	.db #0xff	; 255
   7320 FF                  331 	.db #0xff	; 255
   7321 FF                  332 	.db #0xff	; 255
   7322 FF                  333 	.db #0xff	; 255
   7323 FF                  334 	.db #0xff	; 255
   7324 FF                  335 	.db #0xff	; 255
   7325 FF                  336 	.db #0xff	; 255
   7326 FF                  337 	.db #0xff	; 255
   7327 FF                  338 	.db #0xff	; 255
   7328 FF                  339 	.db #0xff	; 255
   7329 FF                  340 	.db #0xff	; 255
   732A FF                  341 	.db #0xff	; 255
   732B FF                  342 	.db #0xff	; 255
   732C FF                  343 	.db #0xff	; 255
   732D FF                  344 	.db #0xff	; 255
   732E FF                  345 	.db #0xff	; 255
   732F FF                  346 	.db #0xff	; 255
   7330 FF                  347 	.db #0xff	; 255
   7331 FF                  348 	.db #0xff	; 255
   7332 FF                  349 	.db #0xff	; 255
   7333 FF                  350 	.db #0xff	; 255
   7334 FF                  351 	.db #0xff	; 255
   7335 FF                  352 	.db #0xff	; 255
   7336 FF                  353 	.db #0xff	; 255
   7337 FF                  354 	.db #0xff	; 255
   7338 FF                  355 	.db #0xff	; 255
   7339 FF                  356 	.db #0xff	; 255
   733A FF                  357 	.db #0xff	; 255
   733B FF                  358 	.db #0xff	; 255
   733C FF                  359 	.db #0xff	; 255
   733D FF                  360 	.db #0xff	; 255
   733E FF                  361 	.db #0xff	; 255
   733F FF                  362 	.db #0xff	; 255
   7340 FF                  363 	.db #0xff	; 255
   7341 FF                  364 	.db #0xff	; 255
   7342 FF                  365 	.db #0xff	; 255
   7343 FF                  366 	.db #0xff	; 255
   7344 FF                  367 	.db #0xff	; 255
   7345 FF                  368 	.db #0xff	; 255
   7346 FF                  369 	.db #0xff	; 255
   7347 FF                  370 	.db #0xff	; 255
   7348 FF                  371 	.db #0xff	; 255
   7349 FF                  372 	.db #0xff	; 255
   734A FF                  373 	.db #0xff	; 255
   734B FF                  374 	.db #0xff	; 255
   734C FF                  375 	.db #0xff	; 255
   734D FF                  376 	.db #0xff	; 255
   734E FF                  377 	.db #0xff	; 255
   734F FF                  378 	.db #0xff	; 255
   7350 FF                  379 	.db #0xff	; 255
   7351 FF                  380 	.db #0xff	; 255
   7352 FF                  381 	.db #0xff	; 255
   7353 FF                  382 	.db #0xff	; 255
   7354 FF                  383 	.db #0xff	; 255
   7355 FF                  384 	.db #0xff	; 255
   7356 FF                  385 	.db #0xff	; 255
   7357 FF                  386 	.db #0xff	; 255
   7358 FF                  387 	.db #0xff	; 255
   7359 FF                  388 	.db #0xff	; 255
   735A FF                  389 	.db #0xff	; 255
   735B FF                  390 	.db #0xff	; 255
   735C FF                  391 	.db #0xff	; 255
   735D FF                  392 	.db #0xff	; 255
   735E FF                  393 	.db #0xff	; 255
   735F FF                  394 	.db #0xff	; 255
   7360 FF                  395 	.db #0xff	; 255
   7361 FF                  396 	.db #0xff	; 255
   7362 FF                  397 	.db #0xff	; 255
   7363 FF                  398 	.db #0xff	; 255
   7364 FF                  399 	.db #0xff	; 255
   7365 FF                  400 	.db #0xff	; 255
   7366 FF                  401 	.db #0xff	; 255
   7367 FF                  402 	.db #0xff	; 255
   7368 FF                  403 	.db #0xff	; 255
   7369 FF                  404 	.db #0xff	; 255
   736A FF                  405 	.db #0xff	; 255
   736B FF                  406 	.db #0xff	; 255
   736C FF                  407 	.db #0xff	; 255
   736D FF                  408 	.db #0xff	; 255
   736E FF                  409 	.db #0xff	; 255
   736F FF                  410 	.db #0xff	; 255
   7370 FF                  411 	.db #0xff	; 255
   7371 FF                  412 	.db #0xff	; 255
   7372 FF                  413 	.db #0xff	; 255
   7373 FF                  414 	.db #0xff	; 255
   7374 FF                  415 	.db #0xff	; 255
   7375 FF                  416 	.db #0xff	; 255
   7376 FF                  417 	.db #0xff	; 255
   7377 FF                  418 	.db #0xff	; 255
   7378 FF                  419 	.db #0xff	; 255
   7379 FF                  420 	.db #0xff	; 255
   737A FF                  421 	.db #0xff	; 255
   737B FF                  422 	.db #0xff	; 255
   737C FF                  423 	.db #0xff	; 255
   737D FF                  424 	.db #0xff	; 255
   737E FF                  425 	.db #0xff	; 255
   737F FF                  426 	.db #0xff	; 255
   7380 FF                  427 	.db #0xff	; 255
   7381 FF                  428 	.db #0xff	; 255
   7382 FF                  429 	.db #0xff	; 255
   7383 FF                  430 	.db #0xff	; 255
   7384 FF                  431 	.db #0xff	; 255
   7385 FF                  432 	.db #0xff	; 255
   7386 FF                  433 	.db #0xff	; 255
   7387 FF                  434 	.db #0xff	; 255
   7388 FF                  435 	.db #0xff	; 255
   7389 FF                  436 	.db #0xff	; 255
   738A FF                  437 	.db #0xff	; 255
   738B FF                  438 	.db #0xff	; 255
   738C FF                  439 	.db #0xff	; 255
   738D FF                  440 	.db #0xff	; 255
   738E FF                  441 	.db #0xff	; 255
   738F FF                  442 	.db #0xff	; 255
   7390 FF                  443 	.db #0xff	; 255
   7391 FF                  444 	.db #0xff	; 255
   7392 FF                  445 	.db #0xff	; 255
   7393 FF                  446 	.db #0xff	; 255
   7394 FF                  447 	.db #0xff	; 255
   7395 FF                  448 	.db #0xff	; 255
   7396 FF                  449 	.db #0xff	; 255
   7397 FF                  450 	.db #0xff	; 255
   7398 FF                  451 	.db #0xff	; 255
   7399 FF                  452 	.db #0xff	; 255
   739A FF                  453 	.db #0xff	; 255
   739B FF                  454 	.db #0xff	; 255
   739C FF                  455 	.db #0xff	; 255
   739D FF                  456 	.db #0xff	; 255
   739E FF                  457 	.db #0xff	; 255
   739F FF                  458 	.db #0xff	; 255
   73A0 FF                  459 	.db #0xff	; 255
   73A1 FF                  460 	.db #0xff	; 255
   73A2 FF                  461 	.db #0xff	; 255
   73A3 FF                  462 	.db #0xff	; 255
                            463 	.area _INITIALIZER
                            464 	.area _CABS (ABS)
