{{- define "yarp-ingress.controller.args" -}}
- --environment=Production
- --urls=http://*:{{ .Values.controller.containerPorts.http }};https://*:{{ .Values.controller.containerPorts.https }}
- --controller-class={{ .Values.controller.ingressClassResource.controllerValue }}
- --controller-service-name={{ include "yarp-ingress.fullname" . }}
- --controller-service-namespace={{ .Release.Namespace }}
{{- if .Values.monitor.enabled }}
- --monitor-url={{ printf "http://%s-monitor.%s.svc.cluster.local:8000" (include "yarp-ingress.fullname" .) .Release.Namespace }}/api/dispatch
{{- end }}
{{- end -}}
