declare module "@salesforce/apex/debugDPEController.getDPEList" {
  export default function getDPEList(): Promise<any>;
}
declare module "@salesforce/apex/debugDPEController.updateDPEFile" {
  export default function updateDPEFile(param: {fileData: any, dataSource: any, fileName: any}): Promise<any>;
}
declare module "@salesforce/apex/debugDPEController.getDPEMetadata" {
  export default function getDPEMetadata(param: {dpeId: any}): Promise<any>;
}
