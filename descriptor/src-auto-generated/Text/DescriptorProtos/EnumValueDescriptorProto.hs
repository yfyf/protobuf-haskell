{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Text.DescriptorProtos.EnumValueDescriptorProto (EnumValueDescriptorProto(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.EnumValueOptions as DescriptorProtos (EnumValueOptions)
 
data EnumValueDescriptorProto = EnumValueDescriptorProto{name :: !(P'.Maybe P'.Utf8), number :: !(P'.Maybe P'.Int32),
                                                         options :: !(P'.Maybe DescriptorProtos.EnumValueOptions),
                                                         unknown'field :: !(P'.UnknownField)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.UnknownMessage EnumValueDescriptorProto where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}
 
instance P'.Mergeable EnumValueDescriptorProto where
  mergeAppend (EnumValueDescriptorProto x'1 x'2 x'3 x'4) (EnumValueDescriptorProto y'1 y'2 y'3 y'4)
   = EnumValueDescriptorProto (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
 
instance P'.Default EnumValueDescriptorProto where
  defaultValue = EnumValueDescriptorProto P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire EnumValueDescriptorProto where
  wireSize ft' self'@(EnumValueDescriptorProto x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeUnknownField x'4)
  wirePut ft' self'@(EnumValueDescriptorProto x'1 x'2 x'3 x'4)
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
             P'.wirePutOpt 16 5 x'2
             P'.wirePutOpt 26 11 x'3
             P'.wirePutUnknownField x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{number = Prelude'.Just new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{options = P'.mergeAppend (options old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> EnumValueDescriptorProto) EnumValueDescriptorProto where
  getVal m' f' = f' m'
 
instance P'.GPB EnumValueDescriptorProto
 
instance P'.ReflectDescriptor EnumValueDescriptorProto where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".google.protobuf.EnumValueDescriptorProto\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"EnumValueDescriptorProto\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"EnumValueDescriptorProto.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumValueDescriptorProto.name\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumValueDescriptorProto\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumValueDescriptorProto.number\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumValueDescriptorProto\"], baseName' = FName \"number\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumValueDescriptorProto.options\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumValueDescriptorProto\"], baseName' = FName \"options\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".google.protobuf.EnumValueOptions\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"EnumValueOptions\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = True, lazyFields = False}"
 
instance P'.TextType EnumValueDescriptorProto where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg EnumValueDescriptorProto where
  textPut msg
   = do
       P'.tellT "name" (name msg)
       P'.tellT "number" (number msg)
       P'.tellT "options" (options msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'name, parse'number, parse'options]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))
        parse'number
         = P'.try
            (do
               v <- P'.getT "number"
               Prelude'.return (\ o -> o{number = v}))
        parse'options
         = P'.try
            (do
               v <- P'.getT "options"
               Prelude'.return (\ o -> o{options = v}))