Profile: ObservationExtended
Parent: Observation
Id: observation-extended
Title: "Observation Extended"
Description: "Test of rendering of complex extensions"
* interpretation.extension contains 
  InterpretationExtension named interpretation 0..* MS



Extension: InterpretationExtension
Id: interpretation-extension
Title: "Interpretation Extension"
Description: "Test of rendering of complex extensions"
Context: Observation.interpretation
* extension contains 
    confidenceQuantity 0..1 MS and
  certaintyOfFindingNote 0..1 MS 

* extension[confidenceQuantity].value[x]  only Quantity
* extension[certaintyOfFindingNote].value[x] only string


Instance: ObservationExample
InstanceOf: ObservationExtended
Usage: #example
Title: "Observation Example"
Description: "Test of rendering of complex extensions"
* code.coding.system = SCT
* code.coding.code = #81827009 
* code.coding.display = "Diameter"
* status = http://hl7.org/fhir/observation-status#preliminary "Preliminary"
* interpretation.extension[interpretation].extension[confidenceQuantity].valueQuantity.value = 7
* interpretation.extension[interpretation].extension[certaintyOfFindingNote].valueString = "Confidence range (1 - low to 10 - high)"


Alias: SCT = http://snomed.info/sct



Extension: AnatomicStructureExtension
Id: anatomic-structure-extension
Title: "Anatomic Structure Extension"
Description: "Extension to be used on the Body Structure Resource for either Included or Excluded Structures"
Context: BodyStructure
* extension MS
* extension contains
  structure 1..1 MS and
  laterality 0..1 MS and
  qualifier 0..* MS 

* extension[structure].value[x] only CodeableConcept
* extension[laterality].value[x] only CodeableConcept
* extension[qualifier].value[x] only CodeableConcept

Profile: BodyStructureExtended
Parent: BodyStructure
Id: body-structure-extended
Title: "Body Structure Extended"
Description: "Profile to support multiple structures as in R5"
* extension MS
* extension contains AnatomicStructureExtension named includedStructure 1..* MS 
* extension[includedStructure] ^short = "Included anatomic location(s)"
* extension[includedStructure] ^definition = "Included anatomic location(s)"


Instance: BodyStructureMidAscendingAortaExample
InstanceOf: BodyStructureExtended
Usage: #example
Title: "Mid Ascending Aorta"
Description: "Example for MidAscending Aorta"
* identifier.value = "1234119955"
* identifier.system = "http://my-hospital.com/bodyStructures"

* extension[includedStructure][0].extension[structure].valueCodeableConcept.coding.system = SCT
* extension[includedStructure][=].extension[structure].valueCodeableConcept.coding.code = #54247002
* extension[includedStructure][=].extension[structure].valueCodeableConcept.coding.display = "Ascending aorta"
* extension[includedStructure][=].extension[qualifier].valueCodeableConcept.coding.system = SCT
* extension[includedStructure][=].extension[qualifier].valueCodeableConcept.coding.code = #255562008 
* extension[includedStructure][=].extension[qualifier].valueCodeableConcept.coding.display = "Mid"
* patient = Reference(PatientExample)


Instance: PatientExample
InstanceOf: Patient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"