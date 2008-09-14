module Text.DescriptorProtos.FieldOptions (FieldOptions(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.FieldOptions.CType as DescriptorProtos.FieldOptions (CType)
 
data FieldOptions = FieldOptions{ctype :: P'.Maybe DescriptorProtos.FieldOptions.CType, experimental_map_key :: P'.Maybe P'.Utf8}
                  deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable FieldOptions where
  mergeEmpty = FieldOptions P'.mergeEmpty P'.mergeEmpty
  mergeAppend (FieldOptions x'1 x'2) (FieldOptions y'1 y'2) = FieldOptions (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default FieldOptions where
  defaultValue = FieldOptions (P'.Just P'.defaultValue) (P'.Just P'.defaultValue)
 
instance P'.Wire FieldOptions where
  wireSize ft' self'@(FieldOptions x'1 x'2)
    = case ft' of
        10 -> calc'Size
        11 -> calc'Size
        _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePut ft' self'@(FieldOptions x'1 x'2)
    = case ft' of
        10 -> put'Fields
        11
          -> do
               P'.putSize (P'.wireSize 11 self')
               put'Fields
        _ -> P'.wirePutErr ft' self'
    where
        put'Fields
          = do
              P'.wirePutOpt 8 14 x'1
              P'.wirePutOpt 74 9 x'2
  wireGet ft'
    = case ft' of
        10 -> P'.getBareMessage update'Self
        11 -> P'.getMessage update'Self
        _ -> P'.wireGetErr ft'
    where
        update'Self field'Number old'Self
          = case field'Number of
              1 -> P'.fmap (\ new'Field -> old'Self{ctype = P'.Just new'Field}) (P'.wireGet 14)
              9 -> P'.fmap (\ new'Field -> old'Self{experimental_map_key = P'.Just new'Field}) (P'.wireGet 9)
              _ -> P'.unknownField field'Number
 
instance P'.MessageAPI msg' (msg' -> FieldOptions) FieldOptions where
  getVal m' f' = f' m'
 
instance P'.GPB FieldOptions
 
instance P'.ReflectDescriptor FieldOptions where
  reflectDescriptorInfo _
    = P'.read
        "DescriptorInfo {descName = ProtoName {haskellPrefix = \"Text\", parentModule = \"DescriptorProtos\", baseName = \"FieldOptions\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"FieldOptions.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoName {haskellPrefix = \"Text\", parentModule = \"DescriptorProtos.FieldOptions\", baseName = \"ctype\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, wireTagLength = 1, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {haskellPrefix = \"Text\", parentModule = \"DescriptorProtos.FieldOptions\", baseName = \"CType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoName {haskellPrefix = \"Text\", parentModule = \"DescriptorProtos.FieldOptions\", baseName = \"experimental_map_key\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, wireTagLength = 1, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList []}"