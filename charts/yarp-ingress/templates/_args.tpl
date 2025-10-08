{{- define "yarp-ingress.controller.args" -}}
- --environment=Production
- --urls=http://*:{{ .Values.controller.containerPorts.http }}
- --controller-class={{ .Values.controller.ingressClassResource.controllerValue }}
- --controller-service-name={{ include "yarp-ingress.fullname" . }}
- --controller-service-namespace={{ .Release.Namespace }}
{{- if .Values.monitor.enabled }}
- --monitor-url={{ printf "http://%s-monitor.%s.svc.cluster.local:8000" (include "yarp-ingress.fullname" .) .Release.Namespace }}/api/dispatch
{{- end }}
- --server-certificate-enabled={{ ternary "true" "false" .Values.controller.defaultSslCertificate.enabled }}
- --default-ssl-certificate-secret-name={{ .Values.controller.defaultSslCertificate.secret }}
{{- end -}}

{{- define "yarp-ingress.monitor.args" -}}
- --environment=Production
- --urls=http://*:{{ .Values.monitor.containerPorts.http }}
- --controller-class={{ .Values.controller.ingressClassResource.controllerValue }}
- --controller-service-name={{ include "yarp-ingress.fullname" . }}
- --controller-service-namespace={{ .Release.Namespace }}
{{- end -}}
