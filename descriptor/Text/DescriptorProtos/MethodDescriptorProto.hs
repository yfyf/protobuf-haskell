module Text.DescriptorProtos.MethodDescriptorProto (MethodDescriptorProto(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.MethodOptions as DescriptorProtos (MethodOptions)
 
data MethodDescriptorProto = MethodDescriptorProto{name :: P'.Maybe P'.Utf8, input_type :: P'.Maybe P'.Utf8,
                                                   output_type :: P'.Maybe P'.Utf8,
                                                   options :: P'.Maybe DescriptorProtos.MethodOptions,
                                                   unknown'field :: P'.UnknownField}
                           deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.UnknownMessage MethodDescriptorProto where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}
 
instance P'.Mergeable MethodDescriptorProto where
  mergeEmpty = MethodDescriptorProto P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty
  mergeAppend (MethodDescriptorProto x'1 x'2 x'3 x'4 x'5) (MethodDescriptorProto y'1 y'2 y'3 y'4 y'5)
   = MethodDescriptorProto (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
 
instance P'.Default MethodDescriptorProto where
  defaultValue = MethodDescriptorProto P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire MethodDescriptorProto where
  wireSize ft' self'@(MethodDescriptorProto x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeUnknownField x'5)
  wirePut ft' self'@(MethodDescriptorProto x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 34 11 x'4
             P'.wirePutUnknownField x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith check'allowed
       11 -> P'.getMessageWith check'allowed
       _ -> P'.wireGetErr ft'
    where
        update'Self field'Number old'Self
         = case field'Number of
             1 -> P'.fmap (\ new'Field -> old'Self{name = P'.Just new'Field}) (P'.wireGet 9)
             2 -> P'.fmap (\ new'Field -> old'Self{input_type = P'.Just new'Field}) (P'.wireGet 9)
             3 -> P'.fmap (\ new'Field -> old'Self{output_type = P'.Just new'Field}) (P'.wireGet 9)
             4 -> P'.fmap (\ new'Field -> old'Self{options = P'.mergeAppend (options old'Self) (P'.Just new'Field)}) (P'.wireGet 11)
             _ -> P'.unknownField old'Self field'Number
        allowed'wire'Tags = P'.fromDistinctAscList [10, 18, 26, 34]
        check'allowed wire'Tag field'Number wire'Type old'Self
         = P'.catchError
            (if P'.member wire'Tag allowed'wire'Tags then update'Self field'Number old'Self else
              P'.unknown field'Number wire'Type old'Self)
            (\ _ -> P'.loadUnknown field'Number wire'Type old'Self)
 
instance P'.MessageAPI msg' (msg' -> MethodDescriptorProto) MethodDescriptorProto where
  getVal m' f' = f' m'
 
instance P'.GPB MethodDescriptorProto
 
instance P'.ReflectDescriptor MethodDescriptorProto where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".google.protobuf.MethodDescriptorProto\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"MethodDescriptorProto\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"MethodDescriptorProto.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MethodDescriptorProto.name\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MethodDescriptorProto\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MethodDescriptorProto.input_type\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MethodDescriptorProto\"], baseName' = FName \"input_type\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MethodDescriptorProto.output_type\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MethodDescriptorProto\"], baseName' = FName \"output_type\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.MethodDescriptorProto.options\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"MethodDescriptorProto\"], baseName' = FName \"options\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".google.protobuf.MethodOptions\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"MethodOptions\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True}"