# Ejercicios de Cloudformation
> gianpc

### Consideraciones

- Tener esta opción deshabilitada para poder eliminar facilmente las intancias creadas: **DisableApiTermination: false**

- Rollback: Para ver los errores al momento de subir un plantilla a Cloudformatión se recomienda activar la opción **Conservar los recursos aprovisionados correctamente** <image src="docs/Rollback.png" alt="Descripción de la imagen">

- Normalmente los errores se dan por las AMI las cuales No correponden a la misma región. Ver catalogo de AMIs https://us-west-1.console.aws.amazon.com/ec2/home?region=us-west-1#AMICatalog