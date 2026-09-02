{{/*
Expand the name of the chart.
*/}}
{{- define "shopverse-common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a fully qualified application name.
*/}}
{{- define "shopverse-common.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "shopverse-common.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Common labels.
*/}}
{{- define "shopverse-common.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "shopverse-common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.labels }}
{{ toYaml . }}
{{- end }}
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "shopverse-common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "shopverse-common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Service account name.
*/}}
{{- define "shopverse-common.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "shopverse-common.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Container image.
Supports either tag or digest.

Digest is preferred for GitOps deployments.
*/}}
{{- define "shopverse-common.image" -}}
{{- if .Values.image.digest }}
{{- printf "%s@%s" .Values.image.repository .Values.image.digest }}
{{- else }}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- end }}
{{- end }}
