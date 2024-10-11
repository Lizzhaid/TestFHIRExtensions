// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
/*Profile: MyPatient
Parent: Patient
Description: "An example profile of the Patient resource."
* name 1..* MS
//* obeys shs-meta-tag-pre-release
//* obeys shs-meta-security-sysdev
* obeys shs-meta-security-for-production
* obeys shs-meta-tag-for-development

Instance: PatientExample
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"
* meta.security = #SYSDEV

Instance: PatientExample2
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "Jammie"
  * family = "Pond"
* meta.security = #PATSFTY

Instance: PatientExample3
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "Jammie"
  * family = "Pond"
* meta.security[0] = #SYSDEV
* meta.security[+] = #PATSFTY

Instance: PatientExample4
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "Jammie"
  * family = "Pond"

Invariant: shs-meta-tag-pre-release
Description: "sysdev data in production"
Expression: "meta.security.where(code != 'SYSDEV')"
Severity: #error
XPath: ""  

Invariant: shs-meta-security-sysdev
Description: "test"
Expression: "meta.security.where(code = 'SYSDEV')"
Severity: #error
XPath: ""  

Invariant: shs-meta-security-for-production
Description: "sysdev data in production"
Expression: "meta.security.exists().not() or meta.security.where(code != 'SYSDEV')"
Severity: #error
XPath: ""  

Invariant: shs-meta-tag-for-development
Description: "sysdev data in development"
Expression: "meta.security.exists() and meta.security.where(code = 'SYSDEV')"
Severity: #error
XPath: ""  */