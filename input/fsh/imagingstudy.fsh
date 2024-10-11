Profile: ImagingStudyExtensions  
Parent: ImagingStudy
Id: imaging-study-extensions
Title: "Imaging Study Extensions"
Description: "Test for display of extensions in narratives for Imaging Study"

* extension MS
* extension contains IssuedExtension named issued 1..1 MS
* extension[issued] ^short = "Date / Time when the selection of instances was made"
* extension[issued] ^definition = "Date / Time when the selection of instances was made"
* series.extension MS
* series.extension contains SeriesNumberExtension named seriesNumber 0..1 MS
* series.extension[seriesNumber] ^short = "DICOM Series Number"
* series.extension[seriesNumber] ^definition = "The Series Number for the DICOM Series from which the images were selected."
* series.instance.extension MS
* series.instance.extension contains SubsetExtension named subset 0..* MS
* series.instance.extension[subset] ^short = "The selected subset of the SOP Instance"
* series.instance.extension[subset] ^definition = "Selected subset of the SOP Instance. The content and format of the subset item is determined by the SOP Class of the selected instance. May be one of: - A list of frame numbers selected from a multiframe SOP Instance. - A list of Content Item Observation UID values selected from a DICOM SR or other structured document SOP Instance. - A list of segment numbers selected from a segmentation SOP Instance. - A list of Region of Interest (ROI) numbers selected from a radiotherapy structure set SOP Instance."

Extension: IssuedExtension
Id: issued-extension
Title: "Issued Extension"
Description: "Issued Extension"
Context: ImagingStudy
* value[x] 1..1 MS
* value[x] MS
* valueInstant 1..1 MS
* value[x] only instant

Extension: SeriesNumberExtension
Id: series-number-extension
Title: "Series Number Extension"
Description: "The Series Number for the DICOM Series from which the images were selected."
Context: ImagingStudy.series
* value[x] 1..1  MS
* value[x] only integer
* valueInteger 1..1 MS

Extension: SubsetExtension
Id: subset-extension
Title: "subset extension"
Description: "subset extension"
Context: ImagingStudy.series.instance
* value[x] only string
* value[x] 1..1 MS
* valueString 1..1 MS




Instance: ImagingStudyExtensionsExample
InstanceOf: ImagingStudyExtensions
Usage: #example
Title: "Imaging Study with extensions Example"
Description: "Imaging Study with extensions Example"

* identifier.value = "urn:oid:2.16.124.113543.6003.2588828330.45298.1009"
* identifier.system = "urn:dicom:uid"
* extension[issued].valueInstant = "2021-10-05T10:30:10+01:00" 

* status = #available
* series[0].modality.system = DCM
* series[=].modality.code = #CT
* series[=].uid = "2.16.124.113543.6003.2588828330.45298.1009"
* series[=].extension[seriesNumber].valueInteger = 3
* series[=].instance.uid = "2.16.124.113543.6003.2588828330.45298.100945"
* series[=].instance.sopClass = #1.2.840.10008.5.1.4.1.1.7
* series[=].instance.extension[subset].valueString = "2,4,5"
* series[+].modality.system = DCM
* series[=].modality.code = #CT
* series[=].uid = "2.16.124.113543.6003.2588828330.45298.2309"
* series[=].extension[seriesNumber].valueInteger = 5
* series[=].instance.uid = "2.16.124.113543.6003.2588828330.45298.156745"
* series[=].instance.sopClass = #1.2.840.10008.5.1.4.1.1.7
* series[=].instance.extension[subset].valueString = "6 Frame 1"
* subject = Reference(PatientExample)


Alias: DCM = http://dicom.nema.org/resources/ontology/DCM










