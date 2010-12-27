(defun to-png (tree)
  (let ((fname "graph.dot"))
    (with-open-file (*standard-output*
                      fname
                      :direction :output
                      :if-exists :supersede)
      (labels ((translate-elements (tree parent)
               (if tree
                 (let ((left    (car tree))
                       (element (cadr tree))
                       (right   (caddr tree)))
                   (princ "  ")
                   (princ element)
                   (princ ";")
                   (fresh-line)
                   (if parent
                       (progn (princ "  ")
                              (princ parent)
                              (princ "->")
                              (princ element)
                              (princ ";")
                              (fresh-line)))
                   (translate-elements left  element)
                   (translate-elements right element)))))
        (princ "digraph{")
        (fresh-line)
        (translate-elements tree nil)
        (princ "}")))
    (ext:shell (concatenate 'string "dot -Tpng "   fname " > graph1.png"))
    (ext:shell (concatenate 'string "neato -Tpng " fname " > graph2.png"))))


(defparameter tree 
`((((((((nil
1
nil)
2
(nil
3
nil))
4
((nil
5
nil)
6
(nil
7
nil)))
8
(((nil
9
nil)
10
(nil
11
nil))
12
((nil
13
nil)
14
(nil
15
nil))))
16
((((nil
17
nil)
18
(nil
19
nil))
20
((nil
21
nil)
22
(nil
23
nil)))
24
(((nil
25
nil)
26
(nil
27
nil))
28
((nil
29
nil)
30
(nil
31
nil)))))
32
(((((nil
33
nil)
34
(nil
35
nil))
36
((nil
37
nil)
38
(nil
39
nil)))
40
(((nil
41
nil)
42
(nil
43
nil))
44
((nil
45
nil)
46
(nil
47
nil))))
48
((((nil
49
nil)
50
(nil
51
nil))
52
((nil
53
nil)
54
(nil
55
nil)))
56
(((nil
57
nil)
58
(nil
59
nil))
60
((nil
61
nil)
62
(nil
63
nil))))))
64
((((((nil
65
nil)
66
(nil
67
nil))
68
((nil
69
nil)
70
(nil
71
nil)))
72
(((nil
73
nil)
74
(nil
75
nil))
76
((nil
77
nil)
78
(nil
79
nil))))
80
((((nil
81
nil)
82
(nil
83
nil))
84
((nil
85
nil)
86
(nil
87
nil)))
88
(((nil
89
nil)
90
(nil
91
nil))
92
((nil
93
nil)
94
(nil
95
nil)))))
96
(((((nil
97
nil)
98
(nil
99
nil))
100
((nil
101
nil)
102
(nil
103
nil)))
104
(((nil
105
nil)
106
(nil
107
nil))
108
((nil
109
nil)
110
(nil
111
nil))))
112
((((nil
113
nil)
114
(nil
115
nil))
116
((nil
117
nil)
118
(nil
119
nil)))
120
(((nil
121
nil)
122
(nil
123
nil))
124
((nil
125
nil)
126
(nil
127
nil)))))))
128
(((((((nil
129
nil)
130
(nil
131
nil))
132
((nil
133
nil)
134
(nil
135
nil)))
136
(((nil
137
nil)
138
(nil
139
nil))
140
((nil
141
nil)
142
(nil
143
nil))))
144
((((nil
145
nil)
146
(nil
147
nil))
148
((nil
149
nil)
150
(nil
151
nil)))
152
(((nil
153
nil)
154
(nil
155
nil))
156
((nil
157
nil)
158
(nil
159
nil)))))
160
(((((nil
161
nil)
162
(nil
163
nil))
164
((nil
165
nil)
166
(nil
167
nil)))
168
(((nil
169
nil)
170
(nil
171
nil))
172
((nil
173
nil)
174
(nil
175
nil))))
176
((((nil
177
nil)
178
(nil
179
nil))
180
((nil
181
nil)
182
(nil
183
nil)))
184
(((nil
185
nil)
186
(nil
187
nil))
188
((nil
189
nil)
190
(nil
191
nil))))))
192
((((((nil
193
nil)
194
(nil
195
nil))
196
((nil
197
nil)
198
(nil
199
nil)))
200
(((nil
201
nil)
202
(nil
203
nil))
204
((nil
205
nil)
206
(nil
207
nil))))
208
((((nil
209
nil)
210
(nil
211
nil))
212
((nil
213
nil)
214
(nil
215
nil)))
216
(((nil
217
nil)
218
(nil
219
nil))
220
((nil
221
nil)
222
(nil
223
nil)))))
224
(((((nil
225
nil)
226
(nil
227
nil))
228
((nil
229
nil)
230
(nil
231
nil)))
232
(((nil
233
nil)
234
(nil
235
nil))
236
((nil
237
nil)
238
(nil
239
nil))))
240
((((nil
241
nil)
242
(nil
243
nil))
244
((nil
245
nil)
246
(nil
247
nil)))
248
(((nil
249
nil)
250
(nil
251
nil))
252
((nil
253
nil)
254
(nil
255
nil)))))))))

(to-png tree)