declare module "@salesforce/apex/SectionBlockSequence.getAllBlocks" {
  export default function getAllBlocks(): Promise<any>;
}
declare module "@salesforce/apex/SectionBlockSequence.getBlocksForSection" {
  export default function getBlocksForSection(param: {sectionId: any}): Promise<any>;
}
declare module "@salesforce/apex/SectionBlockSequence.updateSectionBlocks" {
  export default function updateSectionBlocks(param: {sectionId: any, blockIds: any}): Promise<any>;
}
