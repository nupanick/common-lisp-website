;; https://vitovan.com/lispweb3.html

(load ".quicklisp/setup.lisp")
(ql:quickload '(
    hunchentoot
    cl-json))

(hunchentoot:define-easy-handler (say-hello :uri "/hello") (name)
    (setf (hunchentoot:content-type*) "text/plain")
    (format nil
        "Hello, ~a! I am Nupa! I made a website with lisp!"
        name))

(defclass person () (
    (name 
        :accessor name 
        :initarg :name)
    (language 
        :accessor language 
        :initarg :language)
    (bio 
        :accessor bio 
        :initarg :bio)))

(defvar me (make-instance 'person 
    :name "Bob Ross"
    :language "Lisp"
    :bio "There are no mistakes, only happy accidents."))

(hunchentoot:define-easy-handler (say-me :uri "/me") ()
    (setf (hunchentoot:content-type*) "application/json")
    (json:encode-json-to-string me))
    
(hunchentoot:define-easy-handler (say-you :uri "/you") (name)
    (setf (hunchentoot:content-type*) "application/json")
    (json:encode-json-to-string (make-instance 'person
        :name name
        :language "English"
        :bio (format nil "Hello, World! I am ~a!" name))))

(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 8000))
