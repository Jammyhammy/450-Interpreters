(define interpret #f)

(define top-level-env `( (+ ,+) (- ,-) (1 ,1) ))

(define top-level-value 
              (lambda (id) 
                  (let (( pair (assq id top-level-env)))
                        (if pair
                            (cadr pair)
                            (id)))))

(define set-top-level-value! 
              (lambda (id val) 
                  (let (( pair (assq id top-level-env)))
                        (if (null? pair)
                            (id)
                            (set! top-level-env (cons (list id val) top-level-env))))))



(define expand (lambda (exp) 
   (cond
    ((symbol? exp)
    ((number? exp)
    ((pair? exp)
      (case (car exp)
         ((quote) (cadr exp))
         ((
))

;replace the following "..."'s with "id))" to make them dummy functions
;"idl))" for new-env, so that you can load the code.

(letrec
   ((new-env
    (lambda (idl vals env)
                idl))

   (lookup
    (lambda (id env)
               id))
  
   (assign
    (lambda (id val env)
		id))

   (exec
    (lambda (exp env)
      (cond
           ((symbol? exp) (lookup exp env))
           ((number? exp) (lookup exp env))
           ((pair? exp) 
             (case  (car exp)
                   ((quote) (cadr exp))
                   ((lambda)
                          (lambda vals
                                 (exec (cons 'begin (cddr exp))
                                           (new-env (cadr exp) vals env))))
                   ((if) 
                          (if (exec (cadr exp) env)
                              (exec (caddr exp) env)
                              (exec (cadddr exp) env)))
                   ((set!)
                          (assign (cadr exp)
                                      (exec (caddr exp) env)
                                       env))
                   ((begin)
                          (let loop ((exps (cdr exp)))
                              (if (null? (cdr exps))
                                  (exec (car exps) env)
                                  (begin
                                       (exec (car exps) env)
                                       (loop (cdr exps))))))
                   (else
                          (apply (exec (car exp) env)
                                    (map (lambda (x)  (exec x env))
                                             (cdr exp))))))
           (else exp)))))

(set! interpret
      (lambda (exp)
            (exec (expand exp) '()))))
