module UnittestProto.TestMutualRecursionB (TestMutualRecursionB(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified UnittestProto.TestMutualRecursionA as UnittestProto (TestMutualRecursionA)
 
data TestMutualRecursionB = TestMutualRecursionB{a :: P'.Maybe UnittestProto.TestMutualRecursionA,
                                                 optional_int32 :: P'.Maybe P'.Int32}
                          deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable TestMutualRecursionB where
  mergeEmpty = TestMutualRecursionB P'.mergeEmpty P'.mergeEmpty
  mergeAppend (TestMutualRecursionB x'1 x'2) (TestMutualRecursionB y'1 y'2)
    = TestMutualRecursionB (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default TestMutualRecursionB where
  defaultValue = TestMutualRecursionB (P'.Just P'.defaultValue) (P'.Just P'.defaultValue)
 
instance P'.Wire TestMutualRecursionB where
  wireSize ft' self'@(TestMutualRecursionB x'1 x'2)
    = case ft' of
        10 -> calc'Size
        11 -> P'.prependMessageSize calc'Size
        _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 5 x'2)
  wirePut ft' self'@(TestMutualRecursionB x'1 x'2)
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
              P'.wirePutOpt 10 11 x'1
              P'.wirePutOpt 16 5 x'2
  wireGet ft'
    = case ft' of
        10 -> P'.getBareMessage update'Self
        11 -> P'.getMessage update'Self
        _ -> P'.wireGetErr ft'
    where
        update'Self field'Number old'Self
          = case field'Number of
              1 -> P'.fmap (\ new'Field -> old'Self{a = P'.mergeAppend (a old'Self) (P'.Just new'Field)}) (P'.wireGet 11)
              2 -> P'.fmap (\ new'Field -> old'Self{optional_int32 = P'.Just new'Field}) (P'.wireGet 5)
              _ -> P'.unknownField field'Number
 
instance P'.MessageAPI msg' (msg' -> TestMutualRecursionB) TestMutualRecursionB where
  getVal m' f' = f' m'
 
instance P'.GPB TestMutualRecursionB
 
instance P'.ReflectDescriptor TestMutualRecursionB where
  reflectDescriptorInfo _
    = P'.read
        "DescriptorInfo {descName = ProtoName {haskellPrefix = \"\", parentModule = \"UnittestProto\", baseName = \"TestMutualRecursionB\"}, descFilePath = [\"UnittestProto\",\"TestMutualRecursionB.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoName {haskellPrefix = \"\", parentModule = \"UnittestProto.TestMutualRecursionB\", baseName = \"a\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, wireTagLength = 1, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {haskellPrefix = \"\", parentModule = \"UnittestProto\", baseName = \"TestMutualRecursionA\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoName {haskellPrefix = \"\", parentModule = \"UnittestProto.TestMutualRecursionB\", baseName = \"optional_int32\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, wireTagLength = 1, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList []}"