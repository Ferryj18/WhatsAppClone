/* This file was generated by upb_generator from the input file:
 *
 *     envoy/type/matcher/v3/metadata.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_TYPE_MATCHER_V3_METADATA_PROTO_UPB_H_
#define ENVOY_TYPE_MATCHER_V3_METADATA_PROTO_UPB_H_

#include "upb/generated_code_support.h"

#include "envoy/type/matcher/v3/metadata.upb_minitable.h"

#include "envoy/type/matcher/v3/value.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"
#include "validate/validate.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct envoy_type_matcher_v3_MetadataMatcher envoy_type_matcher_v3_MetadataMatcher;
typedef struct envoy_type_matcher_v3_MetadataMatcher_PathSegment envoy_type_matcher_v3_MetadataMatcher_PathSegment;
struct envoy_type_matcher_v3_ValueMatcher;



/* envoy.type.matcher.v3.MetadataMatcher */

UPB_INLINE envoy_type_matcher_v3_MetadataMatcher* envoy_type_matcher_v3_MetadataMatcher_new(upb_Arena* arena) {
  return (envoy_type_matcher_v3_MetadataMatcher*)_upb_Message_New(&envoy__type__matcher__v3__MetadataMatcher_msg_init, arena);
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher* envoy_type_matcher_v3_MetadataMatcher_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_type_matcher_v3_MetadataMatcher* ret = envoy_type_matcher_v3_MetadataMatcher_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__matcher__v3__MetadataMatcher_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher* envoy_type_matcher_v3_MetadataMatcher_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_type_matcher_v3_MetadataMatcher* ret = envoy_type_matcher_v3_MetadataMatcher_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__matcher__v3__MetadataMatcher_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_type_matcher_v3_MetadataMatcher_serialize(const envoy_type_matcher_v3_MetadataMatcher* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__matcher__v3__MetadataMatcher_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_type_matcher_v3_MetadataMatcher_serialize_ex(const envoy_type_matcher_v3_MetadataMatcher* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__matcher__v3__MetadataMatcher_msg_init, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_clear_filter(envoy_type_matcher_v3_MetadataMatcher* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(16, 8), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE upb_StringView envoy_type_matcher_v3_MetadataMatcher_filter(const envoy_type_matcher_v3_MetadataMatcher* msg) {
  upb_StringView default_val = upb_StringView_FromString("");
  upb_StringView ret;
  const upb_MiniTableField field = {1, UPB_SIZE(16, 8), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_clear_path(envoy_type_matcher_v3_MetadataMatcher* msg) {
  const upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE const envoy_type_matcher_v3_MetadataMatcher_PathSegment* const* envoy_type_matcher_v3_MetadataMatcher_path(const envoy_type_matcher_v3_MetadataMatcher* msg, size_t* size) {
  const upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Array* arr = upb_Message_GetArray(msg, &field);
  if (arr) {
    if (size) *size = arr->size;
    return (const envoy_type_matcher_v3_MetadataMatcher_PathSegment* const*)_upb_array_constptr(arr);
  } else {
    if (size) *size = 0;
    return NULL;
  }
}
UPB_INLINE const upb_Array* _envoy_type_matcher_v3_MetadataMatcher_path_upb_array(const envoy_type_matcher_v3_MetadataMatcher* msg, size_t* size) {
  const upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  const upb_Array* arr = upb_Message_GetArray(msg, &field);
  if (size) {
    *size = arr ? arr->size : 0;
  }
  return arr;
}
UPB_INLINE upb_Array* _envoy_type_matcher_v3_MetadataMatcher_path_mutable_upb_array(const envoy_type_matcher_v3_MetadataMatcher* msg, size_t* size, upb_Arena* arena) {
  const upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Array* arr = upb_Message_GetOrCreateMutableArray(
      (upb_Message*)msg, &field, arena);
  if (size) {
    *size = arr ? arr->size : 0;
  }
  return arr;
}
UPB_INLINE bool envoy_type_matcher_v3_MetadataMatcher_has_path(const envoy_type_matcher_v3_MetadataMatcher* msg) {
  size_t size;
  envoy_type_matcher_v3_MetadataMatcher_path(msg, &size);
  return size != 0;
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_clear_value(envoy_type_matcher_v3_MetadataMatcher* msg) {
  const upb_MiniTableField field = {3, UPB_SIZE(8, 32), 1, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE const struct envoy_type_matcher_v3_ValueMatcher* envoy_type_matcher_v3_MetadataMatcher_value(const envoy_type_matcher_v3_MetadataMatcher* msg) {
  const struct envoy_type_matcher_v3_ValueMatcher* default_val = NULL;
  const struct envoy_type_matcher_v3_ValueMatcher* ret;
  const upb_MiniTableField field = {3, UPB_SIZE(8, 32), 1, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE bool envoy_type_matcher_v3_MetadataMatcher_has_value(const envoy_type_matcher_v3_MetadataMatcher* msg) {
  const upb_MiniTableField field = {3, UPB_SIZE(8, 32), 1, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  return _upb_Message_HasNonExtensionField(msg, &field);
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_clear_invert(envoy_type_matcher_v3_MetadataMatcher* msg) {
  const upb_MiniTableField field = {4, UPB_SIZE(12, 1), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE bool envoy_type_matcher_v3_MetadataMatcher_invert(const envoy_type_matcher_v3_MetadataMatcher* msg) {
  bool default_val = false;
  bool ret;
  const upb_MiniTableField field = {4, UPB_SIZE(12, 1), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}

UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_set_filter(envoy_type_matcher_v3_MetadataMatcher *msg, upb_StringView value) {
  const upb_MiniTableField field = {1, UPB_SIZE(16, 8), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment** envoy_type_matcher_v3_MetadataMatcher_mutable_path(envoy_type_matcher_v3_MetadataMatcher* msg, size_t* size) {
  upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Array* arr = upb_Message_GetMutableArray(msg, &field);
  if (arr) {
    if (size) *size = arr->size;
    return (envoy_type_matcher_v3_MetadataMatcher_PathSegment**)_upb_array_ptr(arr);
  } else {
    if (size) *size = 0;
    return NULL;
  }
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment** envoy_type_matcher_v3_MetadataMatcher_resize_path(envoy_type_matcher_v3_MetadataMatcher* msg, size_t size, upb_Arena* arena) {
  upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  return (envoy_type_matcher_v3_MetadataMatcher_PathSegment**)upb_Message_ResizeArrayUninitialized(msg, &field, size, arena);
}
UPB_INLINE struct envoy_type_matcher_v3_MetadataMatcher_PathSegment* envoy_type_matcher_v3_MetadataMatcher_add_path(envoy_type_matcher_v3_MetadataMatcher* msg, upb_Arena* arena) {
  upb_MiniTableField field = {2, UPB_SIZE(4, 24), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  upb_Array* arr = upb_Message_GetOrCreateMutableArray(msg, &field, arena);
  if (!arr || !_upb_Array_ResizeUninitialized(arr, arr->size + 1, arena)) {
    return NULL;
  }
  struct envoy_type_matcher_v3_MetadataMatcher_PathSegment* sub = (struct envoy_type_matcher_v3_MetadataMatcher_PathSegment*)_upb_Message_New(&envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, arena);
  if (!arr || !sub) return NULL;
  _upb_Array_Set(arr, arr->size - 1, &sub, sizeof(sub));
  return sub;
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_set_value(envoy_type_matcher_v3_MetadataMatcher *msg, struct envoy_type_matcher_v3_ValueMatcher* value) {
  const upb_MiniTableField field = {3, UPB_SIZE(8, 32), 1, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE struct envoy_type_matcher_v3_ValueMatcher* envoy_type_matcher_v3_MetadataMatcher_mutable_value(envoy_type_matcher_v3_MetadataMatcher* msg, upb_Arena* arena) {
  struct envoy_type_matcher_v3_ValueMatcher* sub = (struct envoy_type_matcher_v3_ValueMatcher*)envoy_type_matcher_v3_MetadataMatcher_value(msg);
  if (sub == NULL) {
    sub = (struct envoy_type_matcher_v3_ValueMatcher*)_upb_Message_New(&envoy__type__matcher__v3__ValueMatcher_msg_init, arena);
    if (sub) envoy_type_matcher_v3_MetadataMatcher_set_value(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_set_invert(envoy_type_matcher_v3_MetadataMatcher *msg, bool value) {
  const upb_MiniTableField field = {4, UPB_SIZE(12, 1), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}

/* envoy.type.matcher.v3.MetadataMatcher.PathSegment */

UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment* envoy_type_matcher_v3_MetadataMatcher_PathSegment_new(upb_Arena* arena) {
  return (envoy_type_matcher_v3_MetadataMatcher_PathSegment*)_upb_Message_New(&envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, arena);
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment* envoy_type_matcher_v3_MetadataMatcher_PathSegment_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_type_matcher_v3_MetadataMatcher_PathSegment* ret = envoy_type_matcher_v3_MetadataMatcher_PathSegment_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment* envoy_type_matcher_v3_MetadataMatcher_PathSegment_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_type_matcher_v3_MetadataMatcher_PathSegment* ret = envoy_type_matcher_v3_MetadataMatcher_PathSegment_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_type_matcher_v3_MetadataMatcher_PathSegment_serialize(const envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_type_matcher_v3_MetadataMatcher_PathSegment_serialize_ex(const envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init, options, arena, &ptr, len);
  return ptr;
}
typedef enum {
  envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_key = 1,
  envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_NOT_SET = 0
} envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_oneofcases;
UPB_INLINE envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_oneofcases envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_case(const envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), -1, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  return (envoy_type_matcher_v3_MetadataMatcher_PathSegment_segment_oneofcases)upb_Message_WhichOneofFieldNumber(msg, &field);
}
UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_PathSegment_clear_key(envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), -1, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE upb_StringView envoy_type_matcher_v3_MetadataMatcher_PathSegment_key(const envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg) {
  upb_StringView default_val = upb_StringView_FromString("");
  upb_StringView ret;
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), -1, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE bool envoy_type_matcher_v3_MetadataMatcher_PathSegment_has_key(const envoy_type_matcher_v3_MetadataMatcher_PathSegment* msg) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), -1, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  return _upb_Message_HasNonExtensionField(msg, &field);
}

UPB_INLINE void envoy_type_matcher_v3_MetadataMatcher_PathSegment_set_key(envoy_type_matcher_v3_MetadataMatcher_PathSegment *msg, upb_StringView value) {
  const upb_MiniTableField field = {1, UPB_SIZE(4, 8), -1, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* ENVOY_TYPE_MATCHER_V3_METADATA_PROTO_UPB_H_ */
