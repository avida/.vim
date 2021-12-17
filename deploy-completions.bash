#!/usr/bin/env bash
_generate_actions_completion() {
      lls=$(ls actions | grep -v ^_ | sed s/.sh//)
      lls+=" secrets-pack secrets-unpack secrets-update"
      COMPREPLY=$(compgen -W "$lls" -- "${COMP_WORDS[-1]}")
}

_do_completions(){
   if [ ${COMP_WORDS[-1]} == "-a" ]
   then
      _generate_actions_completion
   else
      if [ "${COMP_LINE[-1]}" == " " ]
      then
         COMPREPLY=$(compgen -W "-a" "${COMP_WORDS[-1]}")
      else
         _generate_actions_completion
      fi
   fi
}

complete -F _do_completions  deploy.sh


