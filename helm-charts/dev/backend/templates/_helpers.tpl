{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.image.uri .Values.image.name .Values.image.version }}
{{- end }}


{{/*

=========================================================
OLD IMPLEMENTATION (without printf) — kept for reference
=========================================================
{{- define "shopverse.backend.image" -}}
{{ .Values.image.uri }}/{{ .Values.image.name }}:{{ .Values.image.version }}
{{- end }}

*/}}
