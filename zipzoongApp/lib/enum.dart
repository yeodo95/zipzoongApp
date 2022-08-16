enum InputType { address, type, rent, structure, picture, end }

// address - 주소검색, type - 전/월세, rent - 계약금액, structure - 집구조(옵션),  ㅔ
enum CreateStepType { step_01, step_02, step_03, step_04, end }

enum CreateStepTypeDetail {
  InputAddress,
  InputType,
  InputTypeDetail,
  InputStructure,
  UploadPhoto,
  EndOfInput,
  end
}
