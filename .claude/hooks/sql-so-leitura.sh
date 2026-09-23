#!/usr/bin/env bash
# Deixa passar sem perguntar as consultas que só LEEM a base de dados.
# Qualquer coisa que escreva (insert/update/delete/drop/...) cai no
# comportamento normal e continua a pedir autorização ao Luís.
q=$(jq -r '.tool_input.query // ""' | tr 'A-Z' 'a-z')
if echo "$q" | grep -qE '\b(insert|update|delete|drop|alter|truncate|create|grant|revoke|begin|commit|rollback)\b'; then
  echo '{}'
else
  echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"allow","permissionDecisionReason":"consulta so de leitura"}}'
fi
