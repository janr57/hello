
(asdf:make-build :hello 
                 :type :program 
                 :move-here #P"./"
                 :epilogue-code '(si:exit))
(si:exit)

