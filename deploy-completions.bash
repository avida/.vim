#!/usr/bin/env bash
_do_completions(){
   if [ ${COMP_WORDS[-1]} == "-a" ]
   then
      lls=$(ls actions | grep -v ^_ | sed s/.sh//)
      COMPREPLY=$(compgen -W "$lls" -- "${COMP_WORDS[-1]}")
   else
      COMPREPLY=$(compgen -W "-a" "${COMP_WORDS[-1]}")
   fi
}

complete -F _do_completions  deploy.sh


