#pragma once

#include once "crt/stddef.bi"

#if defined(__FB_DOS__) or defined(__FB_UNIX__)
	#include once "pthread.bi"
#endif

#include once "crt/stdarg.bi"

extern "C"

#define miniaudio_h
#define MA_STRINGIFY(x) #x
#define MA_XSTRINGIFY(x) MA_STRINGIFY(x)
const MA_VERSION_MAJOR = 0
const MA_VERSION_MINOR = 11
const MA_VERSION_REVISION = 6
'' TODO: #define MA_VERSION_STRING MA_XSTRINGIFY(MA_VERSION_MAJOR) "." MA_XSTRINGIFY(MA_VERSION_MINOR) "." MA_XSTRINGIFY(MA_VERSION_REVISION)

#if defined(__FB_64BIT__) and (defined(__FB_WIN32__) or defined(__FB_UNIX__))
	const MA_SIZEOF_PTR = 8
#else
	const MA_SIZEOF_PTR = 4
#endif

type ma_int8 as byte
type ma_uint8 as ubyte
type ma_int16 as short
type ma_uint16 as ushort
type ma_int32 as long
type ma_uint32 as ulong
type ma_int64 as longint
type ma_uint64 as ulongint

#if defined(__FB_64BIT__) and (defined(__FB_WIN32__) or defined(__FB_UNIX__))
	type ma_uintptr as ma_uint64
#else
	type ma_uintptr as ma_uint32
#endif

type ma_bool8 as ma_uint8
type ma_bool32 as ma_uint32
const MA_TRUE = 1
const MA_FALSE = 0
type ma_handle as any ptr
type ma_ptr as any ptr
type ma_proc as sub()
#ifndef NULL
const NULL = 0
#endif
const MA_SIZE_MAX = &hFFFFFFFF

#if defined(__FB_DOS__) or defined(__FB_UNIX__)
	#define MA_POSIX
	type ma_pthread_t as pthread_t
	type ma_pthread_mutex_t as pthread_mutex_t
	type ma_pthread_cond_t as pthread_cond_t
#endif

#ifdef __FB_UNIX__
	#define MA_UNIX
#endif

#ifdef __FB_LINUX__
	#define MA_LINUX
#elseif defined(__FB_FREEBSD__) or defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
	#define MA_BSD
#elseif defined(__FB_DARWIN__)
	#define MA_APPLE
#elseif defined(__FB_WIN32__)
	#define MA_WIN32
	#define MA_WIN32_DESKTOP
#endif

'' TODO: #define MA_INLINE inline __attribute__((always_inline))
'' TODO: #define MA_API extern
'' TODO: #define MA_PRIVATE static
const MA_SIMD_ALIGNMENT = 32

type ma_log_level as long
enum
	MA_LOG_LEVEL_DEBUG = 4
	MA_LOG_LEVEL_INFO = 3
	MA_LOG_LEVEL_WARNING = 2
	MA_LOG_LEVEL_ERROR = 1
end enum

'' TODO: #define MA_ATOMIC(alignment, type) type __attribute__((aligned(alignment)))
type ma_channel as ma_uint8

type _ma_channel_position as long
enum
	MA_CHANNEL_NONE = 0
	MA_CHANNEL_MONO = 1
	MA_CHANNEL_FRONT_LEFT = 2
	MA_CHANNEL_FRONT_RIGHT = 3
	MA_CHANNEL_FRONT_CENTER = 4
	MA_CHANNEL_LFE = 5
	MA_CHANNEL_BACK_LEFT = 6
	MA_CHANNEL_BACK_RIGHT = 7
	MA_CHANNEL_FRONT_LEFT_CENTER = 8
	MA_CHANNEL_FRONT_RIGHT_CENTER = 9
	MA_CHANNEL_BACK_CENTER = 10
	MA_CHANNEL_SIDE_LEFT = 11
	MA_CHANNEL_SIDE_RIGHT = 12
	MA_CHANNEL_TOP_CENTER = 13
	MA_CHANNEL_TOP_FRONT_LEFT = 14
	MA_CHANNEL_TOP_FRONT_CENTER = 15
	MA_CHANNEL_TOP_FRONT_RIGHT = 16
	MA_CHANNEL_TOP_BACK_LEFT = 17
	MA_CHANNEL_TOP_BACK_CENTER = 18
	MA_CHANNEL_TOP_BACK_RIGHT = 19
	MA_CHANNEL_AUX_0 = 20
	MA_CHANNEL_AUX_1 = 21
	MA_CHANNEL_AUX_2 = 22
	MA_CHANNEL_AUX_3 = 23
	MA_CHANNEL_AUX_4 = 24
	MA_CHANNEL_AUX_5 = 25
	MA_CHANNEL_AUX_6 = 26
	MA_CHANNEL_AUX_7 = 27
	MA_CHANNEL_AUX_8 = 28
	MA_CHANNEL_AUX_9 = 29
	MA_CHANNEL_AUX_10 = 30
	MA_CHANNEL_AUX_11 = 31
	MA_CHANNEL_AUX_12 = 32
	MA_CHANNEL_AUX_13 = 33
	MA_CHANNEL_AUX_14 = 34
	MA_CHANNEL_AUX_15 = 35
	MA_CHANNEL_AUX_16 = 36
	MA_CHANNEL_AUX_17 = 37
	MA_CHANNEL_AUX_18 = 38
	MA_CHANNEL_AUX_19 = 39
	MA_CHANNEL_AUX_20 = 40
	MA_CHANNEL_AUX_21 = 41
	MA_CHANNEL_AUX_22 = 42
	MA_CHANNEL_AUX_23 = 43
	MA_CHANNEL_AUX_24 = 44
	MA_CHANNEL_AUX_25 = 45
	MA_CHANNEL_AUX_26 = 46
	MA_CHANNEL_AUX_27 = 47
	MA_CHANNEL_AUX_28 = 48
	MA_CHANNEL_AUX_29 = 49
	MA_CHANNEL_AUX_30 = 50
	MA_CHANNEL_AUX_31 = 51
	MA_CHANNEL_LEFT = MA_CHANNEL_FRONT_LEFT
	MA_CHANNEL_RIGHT = MA_CHANNEL_FRONT_RIGHT
	MA_CHANNEL_POSITION_COUNT = MA_CHANNEL_AUX_31 + 1
end enum

type ma_result as long
enum
	MA_SUCCESS = 0
	MA_ERROR = -1
	MA_INVALID_ARGS = -2
	MA_INVALID_OPERATION = -3
	MA_OUT_OF_MEMORY = -4
	MA_OUT_OF_RANGE = -5
	MA_ACCESS_DENIED = -6
	MA_DOES_NOT_EXIST = -7
	MA_ALREADY_EXISTS = -8
	MA_TOO_MANY_OPEN_FILES = -9
	MA_INVALID_FILE = -10
	MA_TOO_BIG = -11
	MA_PATH_TOO_LONG = -12
	MA_NAME_TOO_LONG = -13
	MA_NOT_DIRECTORY = -14
	MA_IS_DIRECTORY = -15
	MA_DIRECTORY_NOT_EMPTY = -16
	MA_AT_END = -17
	MA_NO_SPACE = -18
	MA_BUSY = -19
	MA_IO_ERROR = -20
	MA_INTERRUPT = -21
	MA_UNAVAILABLE = -22
	MA_ALREADY_IN_USE = -23
	MA_BAD_ADDRESS = -24
	MA_BAD_SEEK = -25
	MA_BAD_PIPE = -26
	MA_DEADLOCK = -27
	MA_TOO_MANY_LINKS = -28
	MA_NOT_IMPLEMENTED = -29
	MA_NO_MESSAGE = -30
	MA_BAD_MESSAGE = -31
	MA_NO_DATA_AVAILABLE = -32
	MA_INVALID_DATA = -33
	MA_TIMEOUT = -34
	MA_NO_NETWORK = -35
	MA_NOT_UNIQUE = -36
	MA_NOT_SOCKET = -37
	MA_NO_ADDRESS = -38
	MA_BAD_PROTOCOL = -39
	MA_PROTOCOL_UNAVAILABLE = -40
	MA_PROTOCOL_NOT_SUPPORTED = -41
	MA_PROTOCOL_FAMILY_NOT_SUPPORTED = -42
	MA_ADDRESS_FAMILY_NOT_SUPPORTED = -43
	MA_SOCKET_NOT_SUPPORTED = -44
	MA_CONNECTION_RESET = -45
	MA_ALREADY_CONNECTED = -46
	MA_NOT_CONNECTED = -47
	MA_CONNECTION_REFUSED = -48
	MA_NO_HOST = -49
	MA_IN_PROGRESS = -50
	MA_CANCELLED = -51
	MA_MEMORY_ALREADY_MAPPED = -52
	MA_FORMAT_NOT_SUPPORTED = -100
	MA_DEVICE_TYPE_NOT_SUPPORTED = -101
	MA_SHARE_MODE_NOT_SUPPORTED = -102
	MA_NO_BACKEND = -103
	MA_NO_DEVICE = -104
	MA_API_NOT_FOUND = -105
	MA_INVALID_DEVICE_CONFIG = -106
	MA_LOOP = -107
	MA_DEVICE_NOT_INITIALIZED = -200
	MA_DEVICE_ALREADY_INITIALIZED = -201
	MA_DEVICE_NOT_STARTED = -202
	MA_DEVICE_NOT_STOPPED = -203
	MA_FAILED_TO_INIT_BACKEND = -300
	MA_FAILED_TO_OPEN_BACKEND_DEVICE = -301
	MA_FAILED_TO_START_BACKEND_DEVICE = -302
	MA_FAILED_TO_STOP_BACKEND_DEVICE = -303
end enum

const MA_MIN_CHANNELS = 1
const MA_MAX_CHANNELS = 254
const MA_MAX_FILTER_ORDER = 8

type ma_stream_format as long
enum
	ma_stream_format_pcm = 0
end enum

type ma_stream_layout as long
enum
	ma_stream_layout_interleaved = 0
	ma_stream_layout_deinterleaved
end enum

type ma_dither_mode as long
enum
	ma_dither_mode_none = 0
	ma_dither_mode_rectangle
	ma_dither_mode_triangle
end enum

type ma_format as long
enum
	ma_format_unknown = 0
	ma_format_u8 = 1
	ma_format_s16 = 2
	ma_format_s24 = 3
	ma_format_s32 = 4
	ma_format_f32 = 5
	ma_format_count
end enum

type ma_standard_sample_rate as long
enum
	ma_standard_sample_rate_48000 = 48000
	ma_standard_sample_rate_44100 = 44100
	ma_standard_sample_rate_32000 = 32000
	ma_standard_sample_rate_24000 = 24000
	ma_standard_sample_rate_22050 = 22050
	ma_standard_sample_rate_88200 = 88200
	ma_standard_sample_rate_96000 = 96000
	ma_standard_sample_rate_176400 = 176400
	ma_standard_sample_rate_192000 = 192000
	ma_standard_sample_rate_16000 = 16000
	ma_standard_sample_rate_11025 = 11250
	ma_standard_sample_rate_8000 = 8000
	ma_standard_sample_rate_352800 = 352800
	ma_standard_sample_rate_384000 = 384000
	ma_standard_sample_rate_min = ma_standard_sample_rate_8000
	ma_standard_sample_rate_max = ma_standard_sample_rate_384000
	ma_standard_sample_rate_count = 14
end enum

type ma_channel_mix_mode as long
enum
	ma_channel_mix_mode_rectangular = 0
	ma_channel_mix_mode_simple
	ma_channel_mix_mode_custom_weights
	ma_channel_mix_mode_default = ma_channel_mix_mode_rectangular
end enum

type ma_standard_channel_map as long
enum
	ma_standard_channel_map_microsoft
	ma_standard_channel_map_alsa
	ma_standard_channel_map_rfc3551
	ma_standard_channel_map_flac
	ma_standard_channel_map_vorbis
	ma_standard_channel_map_sound4
	ma_standard_channel_map_sndio
	ma_standard_channel_map_webaudio = ma_standard_channel_map_flac
	ma_standard_channel_map_default = ma_standard_channel_map_microsoft
end enum

type ma_performance_profile as long
enum
	ma_performance_profile_low_latency = 0
	ma_performance_profile_conservative
end enum

type ma_allocation_callbacks
	pUserData as any ptr
	onMalloc as function(byval sz as uinteger, byval pUserData as any ptr) as any ptr
	onRealloc as function(byval p as any ptr, byval sz as uinteger, byval pUserData as any ptr) as any ptr
	onFree as sub(byval p as any ptr, byval pUserData as any ptr)
end type

type ma_lcg
	state as ma_int32
end type

type ma_spinlock as ma_uint32

type ma_thread_priority as long
enum
	ma_thread_priority_idle = -5
	ma_thread_priority_lowest = -4
	ma_thread_priority_low = -3
	ma_thread_priority_normal = -2
	ma_thread_priority_high = -1
	ma_thread_priority_highest = 0
	ma_thread_priority_realtime = 1
	ma_thread_priority_default = 0
end enum

#ifdef __FB_WIN32__
	type ma_thread as ma_handle
	type ma_mutex as ma_handle
	type ma_event as ma_handle
	type ma_semaphore as ma_handle
#else
	type ma_thread as ma_pthread_t
	type ma_mutex as ma_pthread_mutex_t

	type ma_event
		value as ma_uint32
		lock as ma_pthread_mutex_t
		cond as ma_pthread_cond_t
	end type

	type ma_semaphore
		value as long
		lock as ma_pthread_mutex_t
		cond as ma_pthread_cond_t
	end type
#endif

declare sub ma_version(byval pMajor as ma_uint32 ptr, byval pMinor as ma_uint32 ptr, byval pRevision as ma_uint32 ptr)
declare function ma_version_string() as const zstring ptr
#define MA_ATTRIBUTE_FORMAT(fmt, va)
const MA_MAX_LOG_CALLBACKS = 4
type ma_log_callback_proc as sub(byval pUserData as any ptr, byval level as ma_uint32, byval pMessage as const zstring ptr)

type ma_log_callback
	onLog as ma_log_callback_proc
	pUserData as any ptr
end type

declare function ma_log_callback_init(byval onLog as ma_log_callback_proc, byval pUserData as any ptr) as ma_log_callback

type ma_log
	callbacks(0 to 3) as ma_log_callback
	callbackCount as ma_uint32
	allocationCallbacks as ma_allocation_callbacks
	lock as ma_mutex
end type

declare function ma_log_init(byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pLog as ma_log ptr) as ma_result
declare sub ma_log_uninit(byval pLog as ma_log ptr)
declare function ma_log_register_callback(byval pLog as ma_log ptr, byval callback as ma_log_callback) as ma_result
declare function ma_log_unregister_callback(byval pLog as ma_log ptr, byval callback as ma_log_callback) as ma_result
declare function ma_log_post(byval pLog as ma_log ptr, byval level as ma_uint32, byval pMessage as const zstring ptr) as ma_result
declare function ma_log_postv(byval pLog as ma_log ptr, byval level as ma_uint32, byval pFormat as const zstring ptr, byval args as va_list) as ma_result
declare function ma_log_postf(byval pLog as ma_log ptr, byval level as ma_uint32, byval pFormat as const zstring ptr, ...) as ma_result

union ma_biquad_coefficient
	f32 as single
	s32 as ma_int32
end union

type ma_biquad_config
	format as ma_format
	channels as ma_uint32
	b0 as double
	b1 as double
	b2 as double
	a0 as double
	a1 as double
	a2 as double
end type

declare function ma_biquad_config_init(byval format as ma_format, byval channels as ma_uint32, byval b0 as double, byval b1 as double, byval b2 as double, byval a0 as double, byval a1 as double, byval a2 as double) as ma_biquad_config

type ma_biquad
	format as ma_format
	channels as ma_uint32
	b0 as ma_biquad_coefficient
	b1 as ma_biquad_coefficient
	b2 as ma_biquad_coefficient
	a1 as ma_biquad_coefficient
	a2 as ma_biquad_coefficient
	pR1 as ma_biquad_coefficient ptr
	pR2 as ma_biquad_coefficient ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_biquad_get_heap_size(byval pConfig as const ma_biquad_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_biquad_init_preallocated(byval pConfig as const ma_biquad_config ptr, byval pHeap as any ptr, byval pBQ as ma_biquad ptr) as ma_result
declare function ma_biquad_init(byval pConfig as const ma_biquad_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pBQ as ma_biquad ptr) as ma_result
declare sub ma_biquad_uninit(byval pBQ as ma_biquad ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_biquad_reinit(byval pConfig as const ma_biquad_config ptr, byval pBQ as ma_biquad ptr) as ma_result
declare function ma_biquad_process_pcm_frames(byval pBQ as ma_biquad ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_biquad_get_latency(byval pBQ as const ma_biquad ptr) as ma_uint32

type ma_lpf1_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	q as double
end type

type ma_lpf2_config as ma_lpf1_config
declare function ma_lpf1_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double) as ma_lpf1_config
declare function ma_lpf2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval q as double) as ma_lpf2_config

type ma_lpf1
	format as ma_format
	channels as ma_uint32
	a as ma_biquad_coefficient
	pR1 as ma_biquad_coefficient ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_lpf1_get_heap_size(byval pConfig as const ma_lpf1_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_lpf1_init_preallocated(byval pConfig as const ma_lpf1_config ptr, byval pHeap as any ptr, byval pLPF as ma_lpf1 ptr) as ma_result
declare function ma_lpf1_init(byval pConfig as const ma_lpf1_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pLPF as ma_lpf1 ptr) as ma_result
declare sub ma_lpf1_uninit(byval pLPF as ma_lpf1 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_lpf1_reinit(byval pConfig as const ma_lpf1_config ptr, byval pLPF as ma_lpf1 ptr) as ma_result
declare function ma_lpf1_process_pcm_frames(byval pLPF as ma_lpf1 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_lpf1_get_latency(byval pLPF as const ma_lpf1 ptr) as ma_uint32

type ma_lpf2
	bq as ma_biquad
end type

declare function ma_lpf2_get_heap_size(byval pConfig as const ma_lpf2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_lpf2_init_preallocated(byval pConfig as const ma_lpf2_config ptr, byval pHeap as any ptr, byval pHPF as ma_lpf2 ptr) as ma_result
declare function ma_lpf2_init(byval pConfig as const ma_lpf2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pLPF as ma_lpf2 ptr) as ma_result
declare sub ma_lpf2_uninit(byval pLPF as ma_lpf2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_lpf2_reinit(byval pConfig as const ma_lpf2_config ptr, byval pLPF as ma_lpf2 ptr) as ma_result
declare function ma_lpf2_process_pcm_frames(byval pLPF as ma_lpf2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_lpf2_get_latency(byval pLPF as const ma_lpf2 ptr) as ma_uint32

type ma_lpf_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	order as ma_uint32
end type

declare function ma_lpf_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_lpf_config

type ma_lpf
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	lpf1Count as ma_uint32
	lpf2Count as ma_uint32
	pLPF1 as ma_lpf1 ptr
	pLPF2 as ma_lpf2 ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_lpf_get_heap_size(byval pConfig as const ma_lpf_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_lpf_init_preallocated(byval pConfig as const ma_lpf_config ptr, byval pHeap as any ptr, byval pLPF as ma_lpf ptr) as ma_result
declare function ma_lpf_init(byval pConfig as const ma_lpf_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pLPF as ma_lpf ptr) as ma_result
declare sub ma_lpf_uninit(byval pLPF as ma_lpf ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_lpf_reinit(byval pConfig as const ma_lpf_config ptr, byval pLPF as ma_lpf ptr) as ma_result
declare function ma_lpf_process_pcm_frames(byval pLPF as ma_lpf ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_lpf_get_latency(byval pLPF as const ma_lpf ptr) as ma_uint32

type ma_hpf1_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	q as double
end type

type ma_hpf2_config as ma_hpf1_config
declare function ma_hpf1_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double) as ma_hpf1_config
declare function ma_hpf2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval q as double) as ma_hpf2_config

type ma_hpf1
	format as ma_format
	channels as ma_uint32
	a as ma_biquad_coefficient
	pR1 as ma_biquad_coefficient ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_hpf1_get_heap_size(byval pConfig as const ma_hpf1_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_hpf1_init_preallocated(byval pConfig as const ma_hpf1_config ptr, byval pHeap as any ptr, byval pLPF as ma_hpf1 ptr) as ma_result
declare function ma_hpf1_init(byval pConfig as const ma_hpf1_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pHPF as ma_hpf1 ptr) as ma_result
declare sub ma_hpf1_uninit(byval pHPF as ma_hpf1 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_hpf1_reinit(byval pConfig as const ma_hpf1_config ptr, byval pHPF as ma_hpf1 ptr) as ma_result
declare function ma_hpf1_process_pcm_frames(byval pHPF as ma_hpf1 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_hpf1_get_latency(byval pHPF as const ma_hpf1 ptr) as ma_uint32

type ma_hpf2
	bq as ma_biquad
end type

declare function ma_hpf2_get_heap_size(byval pConfig as const ma_hpf2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_hpf2_init_preallocated(byval pConfig as const ma_hpf2_config ptr, byval pHeap as any ptr, byval pHPF as ma_hpf2 ptr) as ma_result
declare function ma_hpf2_init(byval pConfig as const ma_hpf2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pHPF as ma_hpf2 ptr) as ma_result
declare sub ma_hpf2_uninit(byval pHPF as ma_hpf2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_hpf2_reinit(byval pConfig as const ma_hpf2_config ptr, byval pHPF as ma_hpf2 ptr) as ma_result
declare function ma_hpf2_process_pcm_frames(byval pHPF as ma_hpf2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_hpf2_get_latency(byval pHPF as const ma_hpf2 ptr) as ma_uint32

type ma_hpf_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	order as ma_uint32
end type

declare function ma_hpf_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_hpf_config

type ma_hpf
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	hpf1Count as ma_uint32
	hpf2Count as ma_uint32
	pHPF1 as ma_hpf1 ptr
	pHPF2 as ma_hpf2 ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_hpf_get_heap_size(byval pConfig as const ma_hpf_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_hpf_init_preallocated(byval pConfig as const ma_hpf_config ptr, byval pHeap as any ptr, byval pLPF as ma_hpf ptr) as ma_result
declare function ma_hpf_init(byval pConfig as const ma_hpf_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pHPF as ma_hpf ptr) as ma_result
declare sub ma_hpf_uninit(byval pHPF as ma_hpf ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_hpf_reinit(byval pConfig as const ma_hpf_config ptr, byval pHPF as ma_hpf ptr) as ma_result
declare function ma_hpf_process_pcm_frames(byval pHPF as ma_hpf ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_hpf_get_latency(byval pHPF as const ma_hpf ptr) as ma_uint32

type ma_bpf2_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	q as double
end type

declare function ma_bpf2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval q as double) as ma_bpf2_config

type ma_bpf2
	bq as ma_biquad
end type

declare function ma_bpf2_get_heap_size(byval pConfig as const ma_bpf2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_bpf2_init_preallocated(byval pConfig as const ma_bpf2_config ptr, byval pHeap as any ptr, byval pBPF as ma_bpf2 ptr) as ma_result
declare function ma_bpf2_init(byval pConfig as const ma_bpf2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pBPF as ma_bpf2 ptr) as ma_result
declare sub ma_bpf2_uninit(byval pBPF as ma_bpf2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_bpf2_reinit(byval pConfig as const ma_bpf2_config ptr, byval pBPF as ma_bpf2 ptr) as ma_result
declare function ma_bpf2_process_pcm_frames(byval pBPF as ma_bpf2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_bpf2_get_latency(byval pBPF as const ma_bpf2 ptr) as ma_uint32

type ma_bpf_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	cutoffFrequency as double
	order as ma_uint32
end type

declare function ma_bpf_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_bpf_config

type ma_bpf
	format as ma_format
	channels as ma_uint32
	bpf2Count as ma_uint32
	pBPF2 as ma_bpf2 ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_bpf_get_heap_size(byval pConfig as const ma_bpf_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_bpf_init_preallocated(byval pConfig as const ma_bpf_config ptr, byval pHeap as any ptr, byval pBPF as ma_bpf ptr) as ma_result
declare function ma_bpf_init(byval pConfig as const ma_bpf_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pBPF as ma_bpf ptr) as ma_result
declare sub ma_bpf_uninit(byval pBPF as ma_bpf ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_bpf_reinit(byval pConfig as const ma_bpf_config ptr, byval pBPF as ma_bpf ptr) as ma_result
declare function ma_bpf_process_pcm_frames(byval pBPF as ma_bpf ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_bpf_get_latency(byval pBPF as const ma_bpf ptr) as ma_uint32

type ma_notch2_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	q as double
	frequency as double
end type

type ma_notch_config as ma_notch2_config
declare function ma_notch2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval q as double, byval frequency as double) as ma_notch2_config

type ma_notch2
	bq as ma_biquad
end type

declare function ma_notch2_get_heap_size(byval pConfig as const ma_notch2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_notch2_init_preallocated(byval pConfig as const ma_notch2_config ptr, byval pHeap as any ptr, byval pFilter as ma_notch2 ptr) as ma_result
declare function ma_notch2_init(byval pConfig as const ma_notch2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pFilter as ma_notch2 ptr) as ma_result
declare sub ma_notch2_uninit(byval pFilter as ma_notch2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_notch2_reinit(byval pConfig as const ma_notch2_config ptr, byval pFilter as ma_notch2 ptr) as ma_result
declare function ma_notch2_process_pcm_frames(byval pFilter as ma_notch2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_notch2_get_latency(byval pFilter as const ma_notch2 ptr) as ma_uint32

type ma_peak2_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	gainDB as double
	q as double
	frequency as double
end type

type ma_peak_config as ma_peak2_config
declare function ma_peak2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval q as double, byval frequency as double) as ma_peak2_config

type ma_peak2
	bq as ma_biquad
end type

declare function ma_peak2_get_heap_size(byval pConfig as const ma_peak2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_peak2_init_preallocated(byval pConfig as const ma_peak2_config ptr, byval pHeap as any ptr, byval pFilter as ma_peak2 ptr) as ma_result
declare function ma_peak2_init(byval pConfig as const ma_peak2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pFilter as ma_peak2 ptr) as ma_result
declare sub ma_peak2_uninit(byval pFilter as ma_peak2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_peak2_reinit(byval pConfig as const ma_peak2_config ptr, byval pFilter as ma_peak2 ptr) as ma_result
declare function ma_peak2_process_pcm_frames(byval pFilter as ma_peak2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_peak2_get_latency(byval pFilter as const ma_peak2 ptr) as ma_uint32

type ma_loshelf2_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	gainDB as double
	shelfSlope as double
	frequency as double
end type

type ma_loshelf_config as ma_loshelf2_config
declare function ma_loshelf2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval shelfSlope as double, byval frequency as double) as ma_loshelf2_config

type ma_loshelf2
	bq as ma_biquad
end type

declare function ma_loshelf2_get_heap_size(byval pConfig as const ma_loshelf2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_loshelf2_init_preallocated(byval pConfig as const ma_loshelf2_config ptr, byval pHeap as any ptr, byval pFilter as ma_loshelf2 ptr) as ma_result
declare function ma_loshelf2_init(byval pConfig as const ma_loshelf2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pFilter as ma_loshelf2 ptr) as ma_result
declare sub ma_loshelf2_uninit(byval pFilter as ma_loshelf2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_loshelf2_reinit(byval pConfig as const ma_loshelf2_config ptr, byval pFilter as ma_loshelf2 ptr) as ma_result
declare function ma_loshelf2_process_pcm_frames(byval pFilter as ma_loshelf2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_loshelf2_get_latency(byval pFilter as const ma_loshelf2 ptr) as ma_uint32

type ma_hishelf2_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	gainDB as double
	shelfSlope as double
	frequency as double
end type

type ma_hishelf_config as ma_hishelf2_config
declare function ma_hishelf2_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval shelfSlope as double, byval frequency as double) as ma_hishelf2_config

type ma_hishelf2
	bq as ma_biquad
end type

declare function ma_hishelf2_get_heap_size(byval pConfig as const ma_hishelf2_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_hishelf2_init_preallocated(byval pConfig as const ma_hishelf2_config ptr, byval pHeap as any ptr, byval pFilter as ma_hishelf2 ptr) as ma_result
declare function ma_hishelf2_init(byval pConfig as const ma_hishelf2_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pFilter as ma_hishelf2 ptr) as ma_result
declare sub ma_hishelf2_uninit(byval pFilter as ma_hishelf2 ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_hishelf2_reinit(byval pConfig as const ma_hishelf2_config ptr, byval pFilter as ma_hishelf2 ptr) as ma_result
declare function ma_hishelf2_process_pcm_frames(byval pFilter as ma_hishelf2 ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_hishelf2_get_latency(byval pFilter as const ma_hishelf2 ptr) as ma_uint32

type ma_delay_config
	channels as ma_uint32
	sampleRate as ma_uint32
	delayInFrames as ma_uint32
	delayStart as ma_bool32
	wet as single
	dry as single
	decay as single
end type

declare function ma_delay_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval delayInFrames as ma_uint32, byval decay as single) as ma_delay_config

type ma_delay
	config as ma_delay_config
	cursor as ma_uint32
	bufferSizeInFrames as ma_uint32
	pBuffer as single ptr
end type

declare function ma_delay_init(byval pConfig as const ma_delay_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pDelay as ma_delay ptr) as ma_result
declare sub ma_delay_uninit(byval pDelay as ma_delay ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_delay_process_pcm_frames(byval pDelay as ma_delay ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint32) as ma_result
declare sub ma_delay_set_wet(byval pDelay as ma_delay ptr, byval value as single)
declare function ma_delay_get_wet(byval pDelay as const ma_delay ptr) as single
declare sub ma_delay_set_dry(byval pDelay as ma_delay ptr, byval value as single)
declare function ma_delay_get_dry(byval pDelay as const ma_delay ptr) as single
declare sub ma_delay_set_decay(byval pDelay as ma_delay ptr, byval value as single)
declare function ma_delay_get_decay(byval pDelay as const ma_delay ptr) as single

type ma_gainer_config
	channels as ma_uint32
	smoothTimeInFrames as ma_uint32
end type

declare function ma_gainer_config_init(byval channels as ma_uint32, byval smoothTimeInFrames as ma_uint32) as ma_gainer_config

type ma_gainer
	config as ma_gainer_config
	t as ma_uint32
	pOldGains as single ptr
	pNewGains as single ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_gainer_get_heap_size(byval pConfig as const ma_gainer_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_gainer_init_preallocated(byval pConfig as const ma_gainer_config ptr, byval pHeap as any ptr, byval pGainer as ma_gainer ptr) as ma_result
declare function ma_gainer_init(byval pConfig as const ma_gainer_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pGainer as ma_gainer ptr) as ma_result
declare sub ma_gainer_uninit(byval pGainer as ma_gainer ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_gainer_process_pcm_frames(byval pGainer as ma_gainer ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_gainer_set_gain(byval pGainer as ma_gainer ptr, byval newGain as single) as ma_result
declare function ma_gainer_set_gains(byval pGainer as ma_gainer ptr, byval pNewGains as single ptr) as ma_result

type ma_pan_mode as long
enum
	ma_pan_mode_balance = 0
	ma_pan_mode_pan
end enum

type ma_panner_config
	format as ma_format
	channels as ma_uint32
	mode as ma_pan_mode
	pan as single
end type

declare function ma_panner_config_init(byval format as ma_format, byval channels as ma_uint32) as ma_panner_config

type ma_panner
	format as ma_format
	channels as ma_uint32
	mode as ma_pan_mode
	pan as single
end type

declare function ma_panner_init(byval pConfig as const ma_panner_config ptr, byval pPanner as ma_panner ptr) as ma_result
declare function ma_panner_process_pcm_frames(byval pPanner as ma_panner ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare sub ma_panner_set_mode(byval pPanner as ma_panner ptr, byval mode as ma_pan_mode)
declare function ma_panner_get_mode(byval pPanner as const ma_panner ptr) as ma_pan_mode
declare sub ma_panner_set_pan(byval pPanner as ma_panner ptr, byval pan as single)
declare function ma_panner_get_pan(byval pPanner as const ma_panner ptr) as single

type ma_fader_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
end type

declare function ma_fader_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32) as ma_fader_config

type ma_fader
	config as ma_fader_config
	volumeBeg as single
	volumeEnd as single
	lengthInFrames as ma_uint64
	cursorInFrames as ma_uint64
end type

declare function ma_fader_init(byval pConfig as const ma_fader_config ptr, byval pFader as ma_fader ptr) as ma_result
declare function ma_fader_process_pcm_frames(byval pFader as ma_fader ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare sub ma_fader_get_data_format(byval pFader as const ma_fader ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr)
declare sub ma_fader_set_fade(byval pFader as ma_fader ptr, byval volumeBeg as single, byval volumeEnd as single, byval lengthInFrames as ma_uint64)
declare function ma_fader_get_current_volume(byval pFader as ma_fader ptr) as single

type ma_vec3f
	x as single
	y as single
	z as single
end type

type ma_attenuation_model as long
enum
	ma_attenuation_model_none
	ma_attenuation_model_inverse
	ma_attenuation_model_linear
	ma_attenuation_model_exponential
end enum

type ma_positioning as long
enum
	ma_positioning_absolute
	ma_positioning_relative
end enum

type ma_handedness as long
enum
	ma_handedness_right
	ma_handedness_left
end enum

type ma_spatializer_listener_config
	channelsOut as ma_uint32
	pChannelMapOut as ma_channel ptr
	handedness as ma_handedness
	coneInnerAngleInRadians as single
	coneOuterAngleInRadians as single
	coneOuterGain as single
	speedOfSound as single
	worldUp as ma_vec3f
end type

declare function ma_spatializer_listener_config_init(byval channelsOut as ma_uint32) as ma_spatializer_listener_config

type ma_spatializer_listener
	config as ma_spatializer_listener_config
	position as ma_vec3f
	direction as ma_vec3f
	velocity as ma_vec3f
	isEnabled as ma_bool32
	_ownsHeap as ma_bool32
	_pHeap as any ptr
end type

declare function ma_spatializer_listener_get_heap_size(byval pConfig as const ma_spatializer_listener_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_spatializer_listener_init_preallocated(byval pConfig as const ma_spatializer_listener_config ptr, byval pHeap as any ptr, byval pListener as ma_spatializer_listener ptr) as ma_result
declare function ma_spatializer_listener_init(byval pConfig as const ma_spatializer_listener_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pListener as ma_spatializer_listener ptr) as ma_result
declare sub ma_spatializer_listener_uninit(byval pListener as ma_spatializer_listener ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_spatializer_listener_get_channel_map(byval pListener as ma_spatializer_listener ptr) as ma_channel ptr
declare sub ma_spatializer_listener_set_cone(byval pListener as ma_spatializer_listener ptr, byval innerAngleInRadians as single, byval outerAngleInRadians as single, byval outerGain as single)
declare sub ma_spatializer_listener_get_cone(byval pListener as const ma_spatializer_listener ptr, byval pInnerAngleInRadians as single ptr, byval pOuterAngleInRadians as single ptr, byval pOuterGain as single ptr)
declare sub ma_spatializer_listener_set_position(byval pListener as ma_spatializer_listener ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_listener_get_position(byval pListener as const ma_spatializer_listener ptr) as ma_vec3f
declare sub ma_spatializer_listener_set_direction(byval pListener as ma_spatializer_listener ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_listener_get_direction(byval pListener as const ma_spatializer_listener ptr) as ma_vec3f
declare sub ma_spatializer_listener_set_velocity(byval pListener as ma_spatializer_listener ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_listener_get_velocity(byval pListener as const ma_spatializer_listener ptr) as ma_vec3f
declare sub ma_spatializer_listener_set_speed_of_sound(byval pListener as ma_spatializer_listener ptr, byval speedOfSound as single)
declare function ma_spatializer_listener_get_speed_of_sound(byval pListener as const ma_spatializer_listener ptr) as single
declare sub ma_spatializer_listener_set_world_up(byval pListener as ma_spatializer_listener ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_listener_get_world_up(byval pListener as const ma_spatializer_listener ptr) as ma_vec3f
declare sub ma_spatializer_listener_set_enabled(byval pListener as ma_spatializer_listener ptr, byval isEnabled as ma_bool32)
declare function ma_spatializer_listener_is_enabled(byval pListener as const ma_spatializer_listener ptr) as ma_bool32

type ma_spatializer_config
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	pChannelMapIn as ma_channel ptr
	attenuationModel as ma_attenuation_model
	positioning as ma_positioning
	handedness as ma_handedness
	minGain as single
	maxGain as single
	minDistance as single
	maxDistance as single
	rolloff as single
	coneInnerAngleInRadians as single
	coneOuterAngleInRadians as single
	coneOuterGain as single
	dopplerFactor as single
	directionalAttenuationFactor as single
	gainSmoothTimeInFrames as ma_uint32
end type

declare function ma_spatializer_config_init(byval channelsIn as ma_uint32, byval channelsOut as ma_uint32) as ma_spatializer_config

type ma_spatializer
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	pChannelMapIn as ma_channel ptr
	attenuationModel as ma_attenuation_model
	positioning as ma_positioning
	handedness as ma_handedness
	minGain as single
	maxGain as single
	minDistance as single
	maxDistance as single
	rolloff as single
	coneInnerAngleInRadians as single
	coneOuterAngleInRadians as single
	coneOuterGain as single
	dopplerFactor as single
	directionalAttenuationFactor as single
	gainSmoothTimeInFrames as ma_uint32
	position as ma_vec3f
	direction as ma_vec3f
	velocity as ma_vec3f
	dopplerPitch as single
	gainer as ma_gainer
	pNewChannelGainsOut as single ptr
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_spatializer_get_heap_size(byval pConfig as const ma_spatializer_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_spatializer_init_preallocated(byval pConfig as const ma_spatializer_config ptr, byval pHeap as any ptr, byval pSpatializer as ma_spatializer ptr) as ma_result
declare function ma_spatializer_init(byval pConfig as const ma_spatializer_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pSpatializer as ma_spatializer ptr) as ma_result
declare sub ma_spatializer_uninit(byval pSpatializer as ma_spatializer ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_spatializer_process_pcm_frames(byval pSpatializer as ma_spatializer ptr, byval pListener as ma_spatializer_listener ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_spatializer_get_input_channels(byval pSpatializer as const ma_spatializer ptr) as ma_uint32
declare function ma_spatializer_get_output_channels(byval pSpatializer as const ma_spatializer ptr) as ma_uint32
declare sub ma_spatializer_set_attenuation_model(byval pSpatializer as ma_spatializer ptr, byval attenuationModel as ma_attenuation_model)
declare function ma_spatializer_get_attenuation_model(byval pSpatializer as const ma_spatializer ptr) as ma_attenuation_model
declare sub ma_spatializer_set_positioning(byval pSpatializer as ma_spatializer ptr, byval positioning as ma_positioning)
declare function ma_spatializer_get_positioning(byval pSpatializer as const ma_spatializer ptr) as ma_positioning
declare sub ma_spatializer_set_rolloff(byval pSpatializer as ma_spatializer ptr, byval rolloff as single)
declare function ma_spatializer_get_rolloff(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_min_gain(byval pSpatializer as ma_spatializer ptr, byval minGain as single)
declare function ma_spatializer_get_min_gain(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_max_gain(byval pSpatializer as ma_spatializer ptr, byval maxGain as single)
declare function ma_spatializer_get_max_gain(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_min_distance(byval pSpatializer as ma_spatializer ptr, byval minDistance as single)
declare function ma_spatializer_get_min_distance(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_max_distance(byval pSpatializer as ma_spatializer ptr, byval maxDistance as single)
declare function ma_spatializer_get_max_distance(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_cone(byval pSpatializer as ma_spatializer ptr, byval innerAngleInRadians as single, byval outerAngleInRadians as single, byval outerGain as single)
declare sub ma_spatializer_get_cone(byval pSpatializer as const ma_spatializer ptr, byval pInnerAngleInRadians as single ptr, byval pOuterAngleInRadians as single ptr, byval pOuterGain as single ptr)
declare sub ma_spatializer_set_doppler_factor(byval pSpatializer as ma_spatializer ptr, byval dopplerFactor as single)
declare function ma_spatializer_get_doppler_factor(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_directional_attenuation_factor(byval pSpatializer as ma_spatializer ptr, byval directionalAttenuationFactor as single)
declare function ma_spatializer_get_directional_attenuation_factor(byval pSpatializer as const ma_spatializer ptr) as single
declare sub ma_spatializer_set_position(byval pSpatializer as ma_spatializer ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_get_position(byval pSpatializer as const ma_spatializer ptr) as ma_vec3f
declare sub ma_spatializer_set_direction(byval pSpatializer as ma_spatializer ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_get_direction(byval pSpatializer as const ma_spatializer ptr) as ma_vec3f
declare sub ma_spatializer_set_velocity(byval pSpatializer as ma_spatializer ptr, byval x as single, byval y as single, byval z as single)
declare function ma_spatializer_get_velocity(byval pSpatializer as const ma_spatializer ptr) as ma_vec3f
declare sub ma_spatializer_get_relative_position_and_direction(byval pSpatializer as const ma_spatializer ptr, byval pListener as const ma_spatializer_listener ptr, byval pRelativePos as ma_vec3f ptr, byval pRelativeDir as ma_vec3f ptr)

type ma_linear_resampler_config
	format as ma_format
	channels as ma_uint32
	sampleRateIn as ma_uint32
	sampleRateOut as ma_uint32
	lpfOrder as ma_uint32
	lpfNyquistFactor as double
end type

declare function ma_linear_resampler_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_linear_resampler_config

union ma_linear_resampler_x0
	f32 as single ptr
	s16 as ma_int16 ptr
end union

union ma_linear_resampler_x1
	f32 as single ptr
	s16 as ma_int16 ptr
end union

type ma_linear_resampler
	config as ma_linear_resampler_config
	inAdvanceInt as ma_uint32
	inAdvanceFrac as ma_uint32
	inTimeInt as ma_uint32
	inTimeFrac as ma_uint32
	x0 as ma_linear_resampler_x0
	x1 as ma_linear_resampler_x1
	lpf as ma_lpf
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_linear_resampler_get_heap_size(byval pConfig as const ma_linear_resampler_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_linear_resampler_init_preallocated(byval pConfig as const ma_linear_resampler_config ptr, byval pHeap as any ptr, byval pResampler as ma_linear_resampler ptr) as ma_result
declare function ma_linear_resampler_init(byval pConfig as const ma_linear_resampler_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pResampler as ma_linear_resampler ptr) as ma_result
declare sub ma_linear_resampler_uninit(byval pResampler as ma_linear_resampler ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_linear_resampler_process_pcm_frames(byval pResampler as ma_linear_resampler ptr, byval pFramesIn as const any ptr, byval pFrameCountIn as ma_uint64 ptr, byval pFramesOut as any ptr, byval pFrameCountOut as ma_uint64 ptr) as ma_result
declare function ma_linear_resampler_set_rate(byval pResampler as ma_linear_resampler ptr, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_result
declare function ma_linear_resampler_set_rate_ratio(byval pResampler as ma_linear_resampler ptr, byval ratioInOut as single) as ma_result
declare function ma_linear_resampler_get_input_latency(byval pResampler as const ma_linear_resampler ptr) as ma_uint64
declare function ma_linear_resampler_get_output_latency(byval pResampler as const ma_linear_resampler ptr) as ma_uint64
declare function ma_linear_resampler_get_required_input_frame_count(byval pResampler as const ma_linear_resampler ptr, byval outputFrameCount as ma_uint64, byval pInputFrameCount as ma_uint64 ptr) as ma_result
declare function ma_linear_resampler_get_expected_output_frame_count(byval pResampler as const ma_linear_resampler ptr, byval inputFrameCount as ma_uint64, byval pOutputFrameCount as ma_uint64 ptr) as ma_result
type ma_resampling_backend as any
type ma_resampler_config as ma_resampler_config_

type ma_resampling_backend_vtable
	onGetHeapSize as function(byval pUserData as any ptr, byval pConfig as const ma_resampler_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
	onInit as function(byval pUserData as any ptr, byval pConfig as const ma_resampler_config ptr, byval pHeap as any ptr, byval ppBackend as ma_resampling_backend ptr ptr) as ma_result
	onUninit as sub(byval pUserData as any ptr, byval pBackend as ma_resampling_backend ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
	onProcess as function(byval pUserData as any ptr, byval pBackend as ma_resampling_backend ptr, byval pFramesIn as const any ptr, byval pFrameCountIn as ma_uint64 ptr, byval pFramesOut as any ptr, byval pFrameCountOut as ma_uint64 ptr) as ma_result
	onSetRate as function(byval pUserData as any ptr, byval pBackend as ma_resampling_backend ptr, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_result
	onGetInputLatency as function(byval pUserData as any ptr, byval pBackend as const ma_resampling_backend ptr) as ma_uint64
	onGetOutputLatency as function(byval pUserData as any ptr, byval pBackend as const ma_resampling_backend ptr) as ma_uint64
	onGetRequiredInputFrameCount as function(byval pUserData as any ptr, byval pBackend as const ma_resampling_backend ptr, byval outputFrameCount as ma_uint64, byval pInputFrameCount as ma_uint64 ptr) as ma_result
	onGetExpectedOutputFrameCount as function(byval pUserData as any ptr, byval pBackend as const ma_resampling_backend ptr, byval inputFrameCount as ma_uint64, byval pOutputFrameCount as ma_uint64 ptr) as ma_result
end type

type ma_resample_algorithm as long
enum
	ma_resample_algorithm_linear = 0
	ma_resample_algorithm_custom
end enum

type ma_resampler_config_linear
	lpfOrder as ma_uint32
end type

type ma_resampler_config_
	format as ma_format
	channels as ma_uint32
	sampleRateIn as ma_uint32
	sampleRateOut as ma_uint32
	algorithm as ma_resample_algorithm
	pBackendVTable as ma_resampling_backend_vtable ptr
	pBackendUserData as any ptr
	linear as ma_resampler_config_linear
end type

declare function ma_resampler_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32, byval algorithm as ma_resample_algorithm) as ma_resampler_config

union ma_resampler_state
	linear as ma_linear_resampler
end union

type ma_resampler
	pBackend as ma_resampling_backend ptr
	pBackendVTable as ma_resampling_backend_vtable ptr
	pBackendUserData as any ptr
	format as ma_format
	channels as ma_uint32
	sampleRateIn as ma_uint32
	sampleRateOut as ma_uint32
	state as ma_resampler_state
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_resampler_get_heap_size(byval pConfig as const ma_resampler_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_resampler_init_preallocated(byval pConfig as const ma_resampler_config ptr, byval pHeap as any ptr, byval pResampler as ma_resampler ptr) as ma_result
declare function ma_resampler_init(byval pConfig as const ma_resampler_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pResampler as ma_resampler ptr) as ma_result
declare sub ma_resampler_uninit(byval pResampler as ma_resampler ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_resampler_process_pcm_frames(byval pResampler as ma_resampler ptr, byval pFramesIn as const any ptr, byval pFrameCountIn as ma_uint64 ptr, byval pFramesOut as any ptr, byval pFrameCountOut as ma_uint64 ptr) as ma_result
declare function ma_resampler_set_rate(byval pResampler as ma_resampler ptr, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_result
declare function ma_resampler_set_rate_ratio(byval pResampler as ma_resampler ptr, byval ratio as single) as ma_result
declare function ma_resampler_get_input_latency(byval pResampler as const ma_resampler ptr) as ma_uint64
declare function ma_resampler_get_output_latency(byval pResampler as const ma_resampler ptr) as ma_uint64
declare function ma_resampler_get_required_input_frame_count(byval pResampler as const ma_resampler ptr, byval outputFrameCount as ma_uint64, byval pInputFrameCount as ma_uint64 ptr) as ma_result
declare function ma_resampler_get_expected_output_frame_count(byval pResampler as const ma_resampler ptr, byval inputFrameCount as ma_uint64, byval pOutputFrameCount as ma_uint64 ptr) as ma_result

type ma_channel_conversion_path as long
enum
	ma_channel_conversion_path_unknown
	ma_channel_conversion_path_passthrough
	ma_channel_conversion_path_mono_out
	ma_channel_conversion_path_mono_in
	ma_channel_conversion_path_shuffle
	ma_channel_conversion_path_weights
end enum

type ma_mono_expansion_mode as long
enum
	ma_mono_expansion_mode_duplicate = 0
	ma_mono_expansion_mode_average
	ma_mono_expansion_mode_stereo_only
	ma_mono_expansion_mode_default = ma_mono_expansion_mode_duplicate
end enum

type ma_channel_converter_config
	format as ma_format
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	pChannelMapIn as const ma_channel ptr
	pChannelMapOut as const ma_channel ptr
	mixingMode as ma_channel_mix_mode
	ppWeights as single ptr ptr
end type

declare function ma_channel_converter_config_init(byval format as ma_format, byval channelsIn as ma_uint32, byval pChannelMapIn as const ma_channel ptr, byval channelsOut as ma_uint32, byval pChannelMapOut as const ma_channel ptr, byval mixingMode as ma_channel_mix_mode) as ma_channel_converter_config

union ma_channel_converter_weights
	f32 as single ptr ptr
	s16 as ma_int32 ptr ptr
end union

type ma_channel_converter
	format as ma_format
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	mixingMode as ma_channel_mix_mode
	conversionPath as ma_channel_conversion_path
	pChannelMapIn as ma_channel ptr
	pChannelMapOut as ma_channel ptr
	pShuffleTable as ma_uint8 ptr
	weights as ma_channel_converter_weights
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_channel_converter_get_heap_size(byval pConfig as const ma_channel_converter_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_channel_converter_init_preallocated(byval pConfig as const ma_channel_converter_config ptr, byval pHeap as any ptr, byval pConverter as ma_channel_converter ptr) as ma_result
declare function ma_channel_converter_init(byval pConfig as const ma_channel_converter_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pConverter as ma_channel_converter ptr) as ma_result
declare sub ma_channel_converter_uninit(byval pConverter as ma_channel_converter ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_channel_converter_process_pcm_frames(byval pConverter as ma_channel_converter ptr, byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_channel_converter_get_input_channel_map(byval pConverter as const ma_channel_converter ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_channel_converter_get_output_channel_map(byval pConverter as const ma_channel_converter ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result

type ma_data_converter_config
	formatIn as ma_format
	formatOut as ma_format
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	sampleRateIn as ma_uint32
	sampleRateOut as ma_uint32
	pChannelMapIn as ma_channel ptr
	pChannelMapOut as ma_channel ptr
	ditherMode as ma_dither_mode
	channelMixMode as ma_channel_mix_mode
	ppChannelWeights as single ptr ptr
	allowDynamicSampleRate as ma_bool32
	resampling as ma_resampler_config
end type

declare function ma_data_converter_config_init_default() as ma_data_converter_config
declare function ma_data_converter_config_init(byval formatIn as ma_format, byval formatOut as ma_format, byval channelsIn as ma_uint32, byval channelsOut as ma_uint32, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_data_converter_config

type ma_data_converter_execution_path as long
enum
	ma_data_converter_execution_path_passthrough
	ma_data_converter_execution_path_format_only
	ma_data_converter_execution_path_channels_only
	ma_data_converter_execution_path_resample_only
	ma_data_converter_execution_path_resample_first
	ma_data_converter_execution_path_channels_first
end enum

type ma_data_converter
	formatIn as ma_format
	formatOut as ma_format
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	sampleRateIn as ma_uint32
	sampleRateOut as ma_uint32
	ditherMode as ma_dither_mode
	executionPath as ma_data_converter_execution_path
	channelConverter as ma_channel_converter
	resampler as ma_resampler
	hasPreFormatConversion as ma_bool8
	hasPostFormatConversion as ma_bool8
	hasChannelConverter as ma_bool8
	hasResampler as ma_bool8
	isPassthrough as ma_bool8
	_ownsHeap as ma_bool8
	_pHeap as any ptr
end type

declare function ma_data_converter_get_heap_size(byval pConfig as const ma_data_converter_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_data_converter_init_preallocated(byval pConfig as const ma_data_converter_config ptr, byval pHeap as any ptr, byval pConverter as ma_data_converter ptr) as ma_result
declare function ma_data_converter_init(byval pConfig as const ma_data_converter_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pConverter as ma_data_converter ptr) as ma_result
declare sub ma_data_converter_uninit(byval pConverter as ma_data_converter ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_data_converter_process_pcm_frames(byval pConverter as ma_data_converter ptr, byval pFramesIn as const any ptr, byval pFrameCountIn as ma_uint64 ptr, byval pFramesOut as any ptr, byval pFrameCountOut as ma_uint64 ptr) as ma_result
declare function ma_data_converter_set_rate(byval pConverter as ma_data_converter ptr, byval sampleRateIn as ma_uint32, byval sampleRateOut as ma_uint32) as ma_result
declare function ma_data_converter_set_rate_ratio(byval pConverter as ma_data_converter ptr, byval ratioInOut as single) as ma_result
declare function ma_data_converter_get_input_latency(byval pConverter as const ma_data_converter ptr) as ma_uint64
declare function ma_data_converter_get_output_latency(byval pConverter as const ma_data_converter ptr) as ma_uint64
declare function ma_data_converter_get_required_input_frame_count(byval pConverter as const ma_data_converter ptr, byval outputFrameCount as ma_uint64, byval pInputFrameCount as ma_uint64 ptr) as ma_result
declare function ma_data_converter_get_expected_output_frame_count(byval pConverter as const ma_data_converter ptr, byval inputFrameCount as ma_uint64, byval pOutputFrameCount as ma_uint64 ptr) as ma_result
declare function ma_data_converter_get_input_channel_map(byval pConverter as const ma_data_converter ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_data_converter_get_output_channel_map(byval pConverter as const ma_data_converter ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare sub ma_pcm_u8_to_s16(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_u8_to_s24(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_u8_to_s32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_u8_to_f32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s16_to_u8(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s16_to_s24(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s16_to_s32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s16_to_f32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s24_to_u8(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s24_to_s16(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s24_to_s32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s24_to_f32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s32_to_u8(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s32_to_s16(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s32_to_s24(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_s32_to_f32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_f32_to_u8(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_f32_to_s16(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_f32_to_s24(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_f32_to_s32(byval pOut as any ptr, byval pIn as const any ptr, byval count as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_pcm_convert(byval pOut as any ptr, byval formatOut as ma_format, byval pIn as const any ptr, byval formatIn as ma_format, byval sampleCount as ma_uint64, byval ditherMode as ma_dither_mode)
declare sub ma_convert_pcm_frames_format(byval pOut as any ptr, byval formatOut as ma_format, byval pIn as const any ptr, byval formatIn as ma_format, byval frameCount as ma_uint64, byval channels as ma_uint32, byval ditherMode as ma_dither_mode)
declare sub ma_deinterleave_pcm_frames(byval format as ma_format, byval channels as ma_uint32, byval frameCount as ma_uint64, byval pInterleavedPCMFrames as const any ptr, byval ppDeinterleavedPCMFrames as any ptr ptr)
declare sub ma_interleave_pcm_frames(byval format as ma_format, byval channels as ma_uint32, byval frameCount as ma_uint64, byval ppDeinterleavedPCMFrames as const any ptr ptr, byval pInterleavedPCMFrames as any ptr)
const MA_CHANNEL_INDEX_NULL = 255
declare function ma_channel_map_get_channel(byval pChannelMap as const ma_channel ptr, byval channelCount as ma_uint32, byval channelIndex as ma_uint32) as ma_channel
declare sub ma_channel_map_init_blank(byval pChannelMap as ma_channel ptr, byval channels as ma_uint32)
declare sub ma_channel_map_init_standard(byval standardChannelMap as ma_standard_channel_map, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger, byval channels as ma_uint32)
declare sub ma_channel_map_copy(byval pOut as ma_channel ptr, byval pIn as const ma_channel ptr, byval channels as ma_uint32)
declare sub ma_channel_map_copy_or_default(byval pOut as ma_channel ptr, byval channelMapCapOut as uinteger, byval pIn as const ma_channel ptr, byval channels as ma_uint32)
declare function ma_channel_map_is_valid(byval pChannelMap as const ma_channel ptr, byval channels as ma_uint32) as ma_bool32
declare function ma_channel_map_is_equal(byval pChannelMapA as const ma_channel ptr, byval pChannelMapB as const ma_channel ptr, byval channels as ma_uint32) as ma_bool32
declare function ma_channel_map_is_blank(byval pChannelMap as const ma_channel ptr, byval channels as ma_uint32) as ma_bool32
declare function ma_channel_map_contains_channel_position(byval channels as ma_uint32, byval pChannelMap as const ma_channel ptr, byval channelPosition as ma_channel) as ma_bool32
declare function ma_convert_frames(byval pOut as any ptr, byval frameCountOut as ma_uint64, byval formatOut as ma_format, byval channelsOut as ma_uint32, byval sampleRateOut as ma_uint32, byval pIn as const any ptr, byval frameCountIn as ma_uint64, byval formatIn as ma_format, byval channelsIn as ma_uint32, byval sampleRateIn as ma_uint32) as ma_uint64
declare function ma_convert_frames_ex(byval pOut as any ptr, byval frameCountOut as ma_uint64, byval pIn as const any ptr, byval frameCountIn as ma_uint64, byval pConfig as const ma_data_converter_config ptr) as ma_uint64

type ma_rb
	pBuffer as any ptr
	subbufferSizeInBytes as ma_uint32
	subbufferCount as ma_uint32
	subbufferStrideInBytes as ma_uint32
	encodedReadOffset as ma_uint32
	encodedWriteOffset as ma_uint32
	ownsBuffer as ma_bool8
	clearOnWriteAcquire as ma_bool8
	allocationCallbacks as ma_allocation_callbacks
end type

declare function ma_rb_init_ex(byval subbufferSizeInBytes as uinteger, byval subbufferCount as uinteger, byval subbufferStrideInBytes as uinteger, byval pOptionalPreallocatedBuffer as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pRB as ma_rb ptr) as ma_result
declare function ma_rb_init(byval bufferSizeInBytes as uinteger, byval pOptionalPreallocatedBuffer as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pRB as ma_rb ptr) as ma_result
declare sub ma_rb_uninit(byval pRB as ma_rb ptr)
declare sub ma_rb_reset(byval pRB as ma_rb ptr)
declare function ma_rb_acquire_read(byval pRB as ma_rb ptr, byval pSizeInBytes as uinteger ptr, byval ppBufferOut as any ptr ptr) as ma_result
declare function ma_rb_commit_read(byval pRB as ma_rb ptr, byval sizeInBytes as uinteger) as ma_result
declare function ma_rb_acquire_write(byval pRB as ma_rb ptr, byval pSizeInBytes as uinteger ptr, byval ppBufferOut as any ptr ptr) as ma_result
declare function ma_rb_commit_write(byval pRB as ma_rb ptr, byval sizeInBytes as uinteger) as ma_result
declare function ma_rb_seek_read(byval pRB as ma_rb ptr, byval offsetInBytes as uinteger) as ma_result
declare function ma_rb_seek_write(byval pRB as ma_rb ptr, byval offsetInBytes as uinteger) as ma_result
declare function ma_rb_pointer_distance(byval pRB as ma_rb ptr) as ma_int32
declare function ma_rb_available_read(byval pRB as ma_rb ptr) as ma_uint32
declare function ma_rb_available_write(byval pRB as ma_rb ptr) as ma_uint32
declare function ma_rb_get_subbuffer_size(byval pRB as ma_rb ptr) as uinteger
declare function ma_rb_get_subbuffer_stride(byval pRB as ma_rb ptr) as uinteger
declare function ma_rb_get_subbuffer_offset(byval pRB as ma_rb ptr, byval subbufferIndex as uinteger) as uinteger
declare function ma_rb_get_subbuffer_ptr(byval pRB as ma_rb ptr, byval subbufferIndex as uinteger, byval pBuffer as any ptr) as any ptr

type ma_pcm_rb
	rb as ma_rb
	format as ma_format
	channels as ma_uint32
end type

declare function ma_pcm_rb_init_ex(byval format as ma_format, byval channels as ma_uint32, byval subbufferSizeInFrames as ma_uint32, byval subbufferCount as ma_uint32, byval subbufferStrideInFrames as ma_uint32, byval pOptionalPreallocatedBuffer as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pRB as ma_pcm_rb ptr) as ma_result
declare function ma_pcm_rb_init(byval format as ma_format, byval channels as ma_uint32, byval bufferSizeInFrames as ma_uint32, byval pOptionalPreallocatedBuffer as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pRB as ma_pcm_rb ptr) as ma_result
declare sub ma_pcm_rb_uninit(byval pRB as ma_pcm_rb ptr)
declare sub ma_pcm_rb_reset(byval pRB as ma_pcm_rb ptr)
declare function ma_pcm_rb_acquire_read(byval pRB as ma_pcm_rb ptr, byval pSizeInFrames as ma_uint32 ptr, byval ppBufferOut as any ptr ptr) as ma_result
declare function ma_pcm_rb_commit_read(byval pRB as ma_pcm_rb ptr, byval sizeInFrames as ma_uint32) as ma_result
declare function ma_pcm_rb_acquire_write(byval pRB as ma_pcm_rb ptr, byval pSizeInFrames as ma_uint32 ptr, byval ppBufferOut as any ptr ptr) as ma_result
declare function ma_pcm_rb_commit_write(byval pRB as ma_pcm_rb ptr, byval sizeInFrames as ma_uint32) as ma_result
declare function ma_pcm_rb_seek_read(byval pRB as ma_pcm_rb ptr, byval offsetInFrames as ma_uint32) as ma_result
declare function ma_pcm_rb_seek_write(byval pRB as ma_pcm_rb ptr, byval offsetInFrames as ma_uint32) as ma_result
declare function ma_pcm_rb_pointer_distance(byval pRB as ma_pcm_rb ptr) as ma_int32
declare function ma_pcm_rb_available_read(byval pRB as ma_pcm_rb ptr) as ma_uint32
declare function ma_pcm_rb_available_write(byval pRB as ma_pcm_rb ptr) as ma_uint32
declare function ma_pcm_rb_get_subbuffer_size(byval pRB as ma_pcm_rb ptr) as ma_uint32
declare function ma_pcm_rb_get_subbuffer_stride(byval pRB as ma_pcm_rb ptr) as ma_uint32
declare function ma_pcm_rb_get_subbuffer_offset(byval pRB as ma_pcm_rb ptr, byval subbufferIndex as ma_uint32) as ma_uint32
declare function ma_pcm_rb_get_subbuffer_ptr(byval pRB as ma_pcm_rb ptr, byval subbufferIndex as ma_uint32, byval pBuffer as any ptr) as any ptr

type ma_duplex_rb
	rb as ma_pcm_rb
end type

declare function ma_duplex_rb_init(byval captureFormat as ma_format, byval captureChannels as ma_uint32, byval sampleRate as ma_uint32, byval captureInternalSampleRate as ma_uint32, byval captureInternalPeriodSizeInFrames as ma_uint32, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pRB as ma_duplex_rb ptr) as ma_result
declare function ma_duplex_rb_uninit(byval pRB as ma_duplex_rb ptr) as ma_result
declare function ma_result_description(byval result as ma_result) as const zstring ptr
declare function ma_malloc(byval sz as uinteger, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as any ptr
declare function ma_calloc(byval sz as uinteger, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as any ptr
declare function ma_realloc(byval p as any ptr, byval sz as uinteger, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as any ptr
declare sub ma_free(byval p as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_aligned_malloc(byval sz as uinteger, byval alignment as uinteger, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as any ptr
declare sub ma_aligned_free(byval p as any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_get_format_name(byval format as ma_format) as const zstring ptr
declare sub ma_blend_f32(byval pOut as single ptr, byval pInA as single ptr, byval pInB as single ptr, byval factor as single, byval channels as ma_uint32)
declare function ma_get_bytes_per_sample(byval format as ma_format) as ma_uint32
#define ma_get_bytes_per_frame(format, channels) cast(ma_uint32, ma_get_bytes_per_sample((format)) * (channels))
declare function ma_log_level_to_string(byval logLevel as ma_uint32) as const zstring ptr
declare function ma_spinlock_lock(byval pSpinlock as ma_spinlock ptr) as ma_result
declare function ma_spinlock_lock_noyield(byval pSpinlock as ma_spinlock ptr) as ma_result
declare function ma_spinlock_unlock(byval pSpinlock as ma_spinlock ptr) as ma_result
declare function ma_mutex_init(byval pMutex as ma_mutex ptr) as ma_result
declare sub ma_mutex_uninit(byval pMutex as ma_mutex ptr)
declare sub ma_mutex_lock(byval pMutex as ma_mutex ptr)
declare sub ma_mutex_unlock(byval pMutex as ma_mutex ptr)
declare function ma_event_init(byval pEvent as ma_event ptr) as ma_result
declare sub ma_event_uninit(byval pEvent as ma_event ptr)
declare function ma_event_wait(byval pEvent as ma_event ptr) as ma_result
declare function ma_event_signal(byval pEvent as ma_event ptr) as ma_result

type ma_fence
	e as ma_event
	counter as ma_uint32
end type

declare function ma_fence_init(byval pFence as ma_fence ptr) as ma_result
declare sub ma_fence_uninit(byval pFence as ma_fence ptr)
declare function ma_fence_acquire(byval pFence as ma_fence ptr) as ma_result
declare function ma_fence_release(byval pFence as ma_fence ptr) as ma_result
declare function ma_fence_wait(byval pFence as ma_fence ptr) as ma_result
type ma_async_notification as any

type ma_async_notification_callbacks
	onSignal as sub(byval pNotification as ma_async_notification ptr)
end type

declare function ma_async_notification_signal(byval pNotification as ma_async_notification ptr) as ma_result

type ma_async_notification_poll
	cb as ma_async_notification_callbacks
	signalled as ma_bool32
end type

declare function ma_async_notification_poll_init(byval pNotificationPoll as ma_async_notification_poll ptr) as ma_result
declare function ma_async_notification_poll_is_signalled(byval pNotificationPoll as const ma_async_notification_poll ptr) as ma_bool32

type ma_async_notification_event
	cb as ma_async_notification_callbacks
	e as ma_event
end type

declare function ma_async_notification_event_init(byval pNotificationEvent as ma_async_notification_event ptr) as ma_result
declare function ma_async_notification_event_uninit(byval pNotificationEvent as ma_async_notification_event ptr) as ma_result
declare function ma_async_notification_event_wait(byval pNotificationEvent as ma_async_notification_event ptr) as ma_result
declare function ma_async_notification_event_signal(byval pNotificationEvent as ma_async_notification_event ptr) as ma_result

type ma_slot_allocator_config
	capacity as ma_uint32
end type

declare function ma_slot_allocator_config_init(byval capacity as ma_uint32) as ma_slot_allocator_config

type ma_slot_allocator_group
	bitfield as ma_uint32
end type

type ma_slot_allocator
	pGroups as ma_slot_allocator_group ptr
	pSlots as ma_uint32 ptr
	count as ma_uint32
	capacity as ma_uint32
	_ownsHeap as ma_bool32
	_pHeap as any ptr
end type

declare function ma_slot_allocator_get_heap_size(byval pConfig as const ma_slot_allocator_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_slot_allocator_init_preallocated(byval pConfig as const ma_slot_allocator_config ptr, byval pHeap as any ptr, byval pAllocator as ma_slot_allocator ptr) as ma_result
declare function ma_slot_allocator_init(byval pConfig as const ma_slot_allocator_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pAllocator as ma_slot_allocator ptr) as ma_result
declare sub ma_slot_allocator_uninit(byval pAllocator as ma_slot_allocator ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_slot_allocator_alloc(byval pAllocator as ma_slot_allocator ptr, byval pSlot as ma_uint64 ptr) as ma_result
declare function ma_slot_allocator_free(byval pAllocator as ma_slot_allocator ptr, byval slot as ma_uint64) as ma_result
type ma_job as ma_job_
type ma_job_proc as function(byval pJob as ma_job ptr) as ma_result

type ma_job_type as long
enum
	MA_JOB_TYPE_QUIT = 0
	MA_JOB_TYPE_CUSTOM
	MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER_NODE
	MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER_NODE
	MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_BUFFER_NODE
	MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER
	MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER
	MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_STREAM
	MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_STREAM
	MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_STREAM
	MA_JOB_TYPE_RESOURCE_MANAGER_SEEK_DATA_STREAM
	MA_JOB_TYPE_DEVICE_AAUDIO_REROUTE
	MA_JOB_TYPE_COUNT
end enum

type ma_job_toc_breakup
	code as ma_uint16
	slot as ma_uint16
	refcount as ma_uint32
end type

union ma_job_toc
	breakup as ma_job_toc_breakup
	allocation as ma_uint64
end union

type ma_job_data_custom
	proc as ma_job_proc
	data0 as ma_uintptr
	data1 as ma_uintptr
end type

type ma_job_data_resourceManager_loadDataBufferNode
	pResourceManager as any ptr
	pDataBufferNode as any ptr
	pFilePath as zstring ptr
	pFilePathW as wstring ptr
	decode as ma_bool32
	pInitNotification as ma_async_notification ptr
	pDoneNotification as ma_async_notification ptr
	pInitFence as ma_fence ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_freeDataBufferNode
	pResourceManager as any ptr
	pDataBufferNode as any ptr
	pDoneNotification as ma_async_notification ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_pageDataBufferNode
	pResourceManager as any ptr
	pDataBufferNode as any ptr
	pDecoder as any ptr
	pDoneNotification as ma_async_notification ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_loadDataBuffer
	pDataBuffer as any ptr
	pInitNotification as ma_async_notification ptr
	pDoneNotification as ma_async_notification ptr
	pInitFence as ma_fence ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_freeDataBuffer
	pDataBuffer as any ptr
	pDoneNotification as ma_async_notification ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_loadDataStream
	pDataStream as any ptr
	pFilePath as zstring ptr
	pFilePathW as wstring ptr
	initialSeekPoint as ma_uint64
	pInitNotification as ma_async_notification ptr
	pInitFence as ma_fence ptr
end type

type ma_job_data_resourceManager_freeDataStream
	pDataStream as any ptr
	pDoneNotification as ma_async_notification ptr
	pDoneFence as ma_fence ptr
end type

type ma_job_data_resourceManager_pageDataStream
	pDataStream as any ptr
	pageIndex as ma_uint32
end type

type ma_job_data_resourceManager_seekDataStream
	pDataStream as any ptr
	frameIndex as ma_uint64
end type

union ma_job_data_resourceManager
	loadDataBufferNode as ma_job_data_resourceManager_loadDataBufferNode
	freeDataBufferNode as ma_job_data_resourceManager_freeDataBufferNode
	pageDataBufferNode as ma_job_data_resourceManager_pageDataBufferNode
	loadDataBuffer as ma_job_data_resourceManager_loadDataBuffer
	freeDataBuffer as ma_job_data_resourceManager_freeDataBuffer
	loadDataStream as ma_job_data_resourceManager_loadDataStream
	freeDataStream as ma_job_data_resourceManager_freeDataStream
	pageDataStream as ma_job_data_resourceManager_pageDataStream
	seekDataStream as ma_job_data_resourceManager_seekDataStream
end union

type ma_job_data_device_aaudio_reroute
	pDevice as any ptr
	deviceType as ma_uint32
end type

union ma_job_data_device_aaudio
	reroute as ma_job_data_device_aaudio_reroute
end union

union ma_job_data_device
	aaudio as ma_job_data_device_aaudio
end union

union ma_job_data
	custom as ma_job_data_custom
	resourceManager as ma_job_data_resourceManager
	device as ma_job_data_device
end union

type ma_job_
	toc as ma_job_toc
	next as ma_uint64
	order as ma_uint32
	data as ma_job_data
end type

declare function ma_job_init(byval code as ma_uint16) as ma_job
declare function ma_job_process(byval pJob as ma_job ptr) as ma_result

type ma_job_queue_flags as long
enum
	MA_JOB_QUEUE_FLAG_NON_BLOCKING = &h00000001
end enum

type ma_job_queue_config
	flags as ma_uint32
	capacity as ma_uint32
end type

declare function ma_job_queue_config_init(byval flags as ma_uint32, byval capacity as ma_uint32) as ma_job_queue_config

type ma_job_queue
	flags as ma_uint32
	capacity as ma_uint32
	head as ma_uint64
	tail as ma_uint64
	sem as ma_semaphore
	allocator as ma_slot_allocator
	pJobs as ma_job ptr
	lock as ma_spinlock
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_job_queue_get_heap_size(byval pConfig as const ma_job_queue_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_job_queue_init_preallocated(byval pConfig as const ma_job_queue_config ptr, byval pHeap as any ptr, byval pQueue as ma_job_queue ptr) as ma_result
declare function ma_job_queue_init(byval pConfig as const ma_job_queue_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pQueue as ma_job_queue ptr) as ma_result
declare sub ma_job_queue_uninit(byval pQueue as ma_job_queue ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_job_queue_post(byval pQueue as ma_job_queue ptr, byval pJob as const ma_job ptr) as ma_result
declare function ma_job_queue_next(byval pQueue as ma_job_queue ptr, byval pJob as ma_job ptr) as ma_result

#ifdef __FB_LINUX__
	#define MA_SUPPORT_ALSA
#endif

#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
	#define MA_SUPPORT_PULSEAUDIO
#elseif defined(__FB_WIN32__)
	#define MA_SUPPORT_WASAPI
	#define MA_SUPPORT_DSOUND
	#define MA_SUPPORT_WINMM
#endif

#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
	#define MA_SUPPORT_JACK
#elseif defined(__FB_FREEBSD__)
	#define MA_SUPPORT_OSS
#elseif defined(__FB_OPENBSD__)
	#define MA_SUPPORT_SNDIO
#endif

#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
	#define MA_SUPPORT_AUDIO4
#elseif defined(__FB_DARWIN__)
	#define MA_SUPPORT_COREAUDIO
#endif

#define MA_SUPPORT_CUSTOM
#define MA_SUPPORT_NULL

#ifdef __FB_LINUX__
	#define MA_HAS_ALSA
#endif

#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
	#define MA_HAS_PULSEAUDIO
#elseif defined(__FB_WIN32__)
	#define MA_HAS_WASAPI
	#define MA_HAS_DSOUND
	#define MA_HAS_WINMM
#endif

#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
	#define MA_HAS_JACK
#elseif defined(__FB_FREEBSD__)
	#define MA_HAS_OSS
#elseif defined(__FB_OPENBSD__)
	#define MA_HAS_SNDIO
#endif

#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
	#define MA_HAS_AUDIO4
#elseif defined(__FB_DARWIN__)
	#define MA_HAS_COREAUDIO
#endif

#define MA_HAS_CUSTOM
#define MA_HAS_NULL

type ma_device_state as long
enum
	ma_device_state_uninitialized = 0
	ma_device_state_stopped = 1
	ma_device_state_started = 2
	ma_device_state_starting = 3
	ma_device_state_stopping = 4
end enum

#ifdef __FB_WIN32__
	type ma_device as ma_device_

	type ma_IMMNotificationClient
		lpVtbl as any ptr
		counter as ma_uint32
		pDevice as ma_device ptr
	end type
#endif

type ma_backend as long
enum
	ma_backend_wasapi
	ma_backend_dsound
	ma_backend_winmm
	ma_backend_coreaudio
	ma_backend_sndio
	ma_backend_audio4
	ma_backend_oss
	ma_backend_pulseaudio
	ma_backend_alsa
	ma_backend_jack
	ma_backend_aaudio
	ma_backend_opensl
	ma_backend_webaudio
	ma_backend_custom
	ma_backend_null
end enum

const MA_BACKEND_COUNT = ma_backend_null + 1

type ma_device_job_thread_config
	noThread as ma_bool32
	jobQueueCapacity as ma_uint32
	jobQueueFlags as ma_uint32
end type

declare function ma_device_job_thread_config_init() as ma_device_job_thread_config

type ma_device_job_thread
	thread as ma_thread
	jobQueue as ma_job_queue
	_hasThread as ma_bool32
end type

declare function ma_device_job_thread_init(byval pConfig as const ma_device_job_thread_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pJobThread as ma_device_job_thread ptr) as ma_result
declare sub ma_device_job_thread_uninit(byval pJobThread as ma_device_job_thread ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_device_job_thread_post(byval pJobThread as ma_device_job_thread ptr, byval pJob as const ma_job ptr) as ma_result
declare function ma_device_job_thread_next(byval pJobThread as ma_device_job_thread ptr, byval pJob as ma_job ptr) as ma_result

type ma_device_notification_type as long
enum
	ma_device_notification_type_started
	ma_device_notification_type_stopped
	ma_device_notification_type_rerouted
	ma_device_notification_type_interruption_began
	ma_device_notification_type_interruption_ended
end enum

type ma_device_notification_data_started
	_unused as long
end type

type ma_device_notification_data_stopped
	_unused as long
end type

type ma_device_notification_data_rerouted
	_unused as long
end type

type ma_device_notification_data_interruption
	_unused as long
end type

union ma_device_notification_data
	started as ma_device_notification_data_started
	stopped as ma_device_notification_data_stopped
	rerouted as ma_device_notification_data_rerouted
	interruption as ma_device_notification_data_interruption
end union

#if defined(__FB_DOS__) or defined(__FB_UNIX__)
	type ma_device as ma_device_
#endif

type ma_device_notification
	pDevice as ma_device ptr
	as ma_device_notification_type type
	data as ma_device_notification_data
end type

type ma_device_notification_proc as sub(byval pNotification as const ma_device_notification ptr)
type ma_device_data_proc as sub(byval pDevice as ma_device ptr, byval pOutput as any ptr, byval pInput as const any ptr, byval frameCount as ma_uint32)
type ma_stop_proc as sub(byval pDevice as ma_device ptr)

type ma_device_type as long
enum
	ma_device_type_playback = 1
	ma_device_type_capture = 2
	ma_device_type_duplex = ma_device_type_playback or ma_device_type_capture
	ma_device_type_loopback = 4
end enum

type ma_share_mode as long
enum
	ma_share_mode_shared = 0
	ma_share_mode_exclusive
end enum

type ma_ios_session_category as long
enum
	ma_ios_session_category_default = 0
	ma_ios_session_category_none
	ma_ios_session_category_ambient
	ma_ios_session_category_solo_ambient
	ma_ios_session_category_playback
	ma_ios_session_category_record
	ma_ios_session_category_play_and_record
	ma_ios_session_category_multi_route
end enum

type ma_ios_session_category_option as long
enum
	ma_ios_session_category_option_mix_with_others = &h01
	ma_ios_session_category_option_duck_others = &h02
	ma_ios_session_category_option_allow_bluetooth = &h04
	ma_ios_session_category_option_default_to_speaker = &h08
	ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = &h11
	ma_ios_session_category_option_allow_bluetooth_a2dp = &h20
	ma_ios_session_category_option_allow_air_play = &h40
end enum

type ma_opensl_stream_type as long
enum
	ma_opensl_stream_type_default = 0
	ma_opensl_stream_type_voice
	ma_opensl_stream_type_system
	ma_opensl_stream_type_ring
	ma_opensl_stream_type_media
	ma_opensl_stream_type_alarm
	ma_opensl_stream_type_notification
end enum

type ma_opensl_recording_preset as long
enum
	ma_opensl_recording_preset_default = 0
	ma_opensl_recording_preset_generic
	ma_opensl_recording_preset_camcorder
	ma_opensl_recording_preset_voice_recognition
	ma_opensl_recording_preset_voice_communication
	ma_opensl_recording_preset_voice_unprocessed
end enum

type ma_aaudio_usage as long
enum
	ma_aaudio_usage_default = 0
	ma_aaudio_usage_announcement
	ma_aaudio_usage_emergency
	ma_aaudio_usage_safety
	ma_aaudio_usage_vehicle_status
	ma_aaudio_usage_alarm
	ma_aaudio_usage_assistance_accessibility
	ma_aaudio_usage_assistance_navigation_guidance
	ma_aaudio_usage_assistance_sonification
	ma_aaudio_usage_assitant
	ma_aaudio_usage_game
	ma_aaudio_usage_media
	ma_aaudio_usage_notification
	ma_aaudio_usage_notification_event
	ma_aaudio_usage_notification_ringtone
	ma_aaudio_usage_voice_communication
	ma_aaudio_usage_voice_communication_signalling
end enum

type ma_aaudio_content_type as long
enum
	ma_aaudio_content_type_default = 0
	ma_aaudio_content_type_movie
	ma_aaudio_content_type_music
	ma_aaudio_content_type_sonification
	ma_aaudio_content_type_speech
end enum

type ma_aaudio_input_preset as long
enum
	ma_aaudio_input_preset_default = 0
	ma_aaudio_input_preset_generic
	ma_aaudio_input_preset_camcorder
	ma_aaudio_input_preset_unprocessed
	ma_aaudio_input_preset_voice_recognition
	ma_aaudio_input_preset_voice_communication
	ma_aaudio_input_preset_voice_performance
end enum

union ma_timer
	counter as ma_int64
	counterD as double
end union

union ma_device_id_custom
	i as long
	s as zstring * 256
	p as any ptr
end union

union ma_device_id
	wasapi as wstring * 64
	dsound(0 to 15) as ma_uint8
	winmm as ma_uint32
	alsa as zstring * 256
	pulse as zstring * 256
	jack as long
	coreaudio as zstring * 256
	sndio as zstring * 256
	audio4 as zstring * 256
	oss as zstring * 64
	aaudio as ma_int32
	opensl as ma_uint32
	webaudio as zstring * 32
	custom as ma_device_id_custom
	nullbackend as long
end union

const MA_DATA_FORMAT_FLAG_EXCLUSIVE_MODE = culng(1u shl 1)
const MA_MAX_DEVICE_NAME_LENGTH = 255

type ma_device_info_nativeDataFormats
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	flags as ma_uint32
end type

type ma_device_info
	id as ma_device_id
	name as zstring * 255 + 1
	isDefault as ma_bool32
	nativeDataFormatCount as ma_uint32
	nativeDataFormats(0 to 63) as ma_device_info_nativeDataFormats
end type

type ma_device_config_playback
	pDeviceID as const ma_device_id ptr
	format as ma_format
	channels as ma_uint32
	pChannelMap as ma_channel ptr
	channelMixMode as ma_channel_mix_mode
	shareMode as ma_share_mode
end type

type ma_device_config_capture
	pDeviceID as const ma_device_id ptr
	format as ma_format
	channels as ma_uint32
	pChannelMap as ma_channel ptr
	channelMixMode as ma_channel_mix_mode
	shareMode as ma_share_mode
end type

type ma_device_config_wasapi
	noAutoConvertSRC as ma_bool8
	noDefaultQualitySRC as ma_bool8
	noAutoStreamRouting as ma_bool8
	noHardwareOffloading as ma_bool8
end type

type ma_device_config_alsa
	noMMap as ma_bool32
	noAutoFormat as ma_bool32
	noAutoChannels as ma_bool32
	noAutoResample as ma_bool32
end type

type ma_device_config_pulse
	pStreamNamePlayback as const zstring ptr
	pStreamNameCapture as const zstring ptr
end type

type ma_device_config_coreaudio
	allowNominalSampleRateChange as ma_bool32
end type

type ma_device_config_opensl
	streamType as ma_opensl_stream_type
	recordingPreset as ma_opensl_recording_preset
end type

type ma_device_config_aaudio
	usage as ma_aaudio_usage
	contentType as ma_aaudio_content_type
	inputPreset as ma_aaudio_input_preset
	noAutoStartAfterReroute as ma_bool32
end type

type ma_device_config
	deviceType as ma_device_type
	sampleRate as ma_uint32
	periodSizeInFrames as ma_uint32
	periodSizeInMilliseconds as ma_uint32
	periods as ma_uint32
	performanceProfile as ma_performance_profile
	noPreSilencedOutputBuffer as ma_bool8
	noClip as ma_bool8
	noDisableDenormals as ma_bool8
	noFixedSizedCallback as ma_bool8
	dataCallback as ma_device_data_proc
	notificationCallback as ma_device_notification_proc
	stopCallback as ma_stop_proc
	pUserData as any ptr
	resampling as ma_resampler_config
	playback as ma_device_config_playback
	capture as ma_device_config_capture
	wasapi as ma_device_config_wasapi
	alsa as ma_device_config_alsa
	pulse as ma_device_config_pulse
	coreaudio as ma_device_config_coreaudio
	opensl as ma_device_config_opensl
	aaudio as ma_device_config_aaudio
end type

type ma_context as ma_context_
type ma_enum_devices_callback_proc as function(byval pContext as ma_context ptr, byval deviceType as ma_device_type, byval pInfo as const ma_device_info ptr, byval pUserData as any ptr) as ma_bool32

type ma_device_descriptor
	pDeviceID as const ma_device_id ptr
	shareMode as ma_share_mode
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	channelMap(0 to 253) as ma_channel
	periodSizeInFrames as ma_uint32
	periodSizeInMilliseconds as ma_uint32
	periodCount as ma_uint32
end type

type ma_context_config as ma_context_config_

type ma_backend_callbacks
	onContextInit as function(byval pContext as ma_context ptr, byval pConfig as const ma_context_config ptr, byval pCallbacks as ma_backend_callbacks ptr) as ma_result
	onContextUninit as function(byval pContext as ma_context ptr) as ma_result
	onContextEnumerateDevices as function(byval pContext as ma_context ptr, byval callback as ma_enum_devices_callback_proc, byval pUserData as any ptr) as ma_result
	onContextGetDeviceInfo as function(byval pContext as ma_context ptr, byval deviceType as ma_device_type, byval pDeviceID as const ma_device_id ptr, byval pDeviceInfo as ma_device_info ptr) as ma_result
	onDeviceInit as function(byval pDevice as ma_device ptr, byval pConfig as const ma_device_config ptr, byval pDescriptorPlayback as ma_device_descriptor ptr, byval pDescriptorCapture as ma_device_descriptor ptr) as ma_result
	onDeviceUninit as function(byval pDevice as ma_device ptr) as ma_result
	onDeviceStart as function(byval pDevice as ma_device ptr) as ma_result
	onDeviceStop as function(byval pDevice as ma_device ptr) as ma_result
	onDeviceRead as function(byval pDevice as ma_device ptr, byval pFrames as any ptr, byval frameCount as ma_uint32, byval pFramesRead as ma_uint32 ptr) as ma_result
	onDeviceWrite as function(byval pDevice as ma_device ptr, byval pFrames as const any ptr, byval frameCount as ma_uint32, byval pFramesWritten as ma_uint32 ptr) as ma_result
	onDeviceDataLoop as function(byval pDevice as ma_device ptr) as ma_result
	onDeviceDataLoopWakeup as function(byval pDevice as ma_device ptr) as ma_result
	onDeviceGetInfo as function(byval pDevice as ma_device ptr, byval type as ma_device_type, byval pDeviceInfo as ma_device_info ptr) as ma_result
end type

type ma_context_config_alsa
	useVerboseDeviceEnumeration as ma_bool32
end type

type ma_context_config_pulse
	pApplicationName as const zstring ptr
	pServerName as const zstring ptr
	tryAutoSpawn as ma_bool32
end type

type ma_context_config_coreaudio
	sessionCategory as ma_ios_session_category
	sessionCategoryOptions as ma_uint32
	noAudioSessionActivate as ma_bool32
	noAudioSessionDeactivate as ma_bool32
end type

type ma_context_config_jack
	pClientName as const zstring ptr
	tryStartServer as ma_bool32
end type

type ma_context_config_
	pLog as ma_log ptr
	threadPriority as ma_thread_priority
	threadStackSize as uinteger
	pUserData as any ptr
	allocationCallbacks as ma_allocation_callbacks
	alsa as ma_context_config_alsa
	pulse as ma_context_config_pulse
	coreaudio as ma_context_config_coreaudio
	jack as ma_context_config_jack
	custom as ma_backend_callbacks
end type

type ma_context_command__wasapi_data_quit
	_unused as long
end type

type ma_context_command__wasapi_data_createAudioClient
	deviceType as ma_device_type
	pAudioClient as any ptr
	ppAudioClientService as any ptr ptr
	pResult as ma_result ptr
end type

type ma_context_command__wasapi_data_releaseAudioClient
	pDevice as ma_device ptr
	deviceType as ma_device_type
end type

union ma_context_command__wasapi_data
	quit as ma_context_command__wasapi_data_quit
	createAudioClient as ma_context_command__wasapi_data_createAudioClient
	releaseAudioClient as ma_context_command__wasapi_data_releaseAudioClient
end union

type ma_context_command__wasapi
	code as long
	pEvent as ma_event ptr
	data as ma_context_command__wasapi_data
end type

#ifdef __FB_LINUX__
	type ma_context_alsa
		asoundSO as ma_handle
		snd_pcm_open as ma_proc
		snd_pcm_close as ma_proc
		snd_pcm_hw_params_sizeof as ma_proc
		snd_pcm_hw_params_any as ma_proc
		snd_pcm_hw_params_set_format as ma_proc
		snd_pcm_hw_params_set_format_first as ma_proc
		snd_pcm_hw_params_get_format_mask as ma_proc
		snd_pcm_hw_params_set_channels as ma_proc
		snd_pcm_hw_params_set_channels_near as ma_proc
		snd_pcm_hw_params_set_channels_minmax as ma_proc
		snd_pcm_hw_params_set_rate_resample as ma_proc
		snd_pcm_hw_params_set_rate as ma_proc
		snd_pcm_hw_params_set_rate_near as ma_proc
		snd_pcm_hw_params_set_buffer_size_near as ma_proc
		snd_pcm_hw_params_set_periods_near as ma_proc
		snd_pcm_hw_params_set_access as ma_proc
		snd_pcm_hw_params_get_format as ma_proc
		snd_pcm_hw_params_get_channels as ma_proc
		snd_pcm_hw_params_get_channels_min as ma_proc
		snd_pcm_hw_params_get_channels_max as ma_proc
		snd_pcm_hw_params_get_rate as ma_proc
		snd_pcm_hw_params_get_rate_min as ma_proc
		snd_pcm_hw_params_get_rate_max as ma_proc
		snd_pcm_hw_params_get_buffer_size as ma_proc
		snd_pcm_hw_params_get_periods as ma_proc
		snd_pcm_hw_params_get_access as ma_proc
		snd_pcm_hw_params_test_format as ma_proc
		snd_pcm_hw_params_test_channels as ma_proc
		snd_pcm_hw_params_test_rate as ma_proc
		snd_pcm_hw_params as ma_proc
		snd_pcm_sw_params_sizeof as ma_proc
		snd_pcm_sw_params_current as ma_proc
		snd_pcm_sw_params_get_boundary as ma_proc
		snd_pcm_sw_params_set_avail_min as ma_proc
		snd_pcm_sw_params_set_start_threshold as ma_proc
		snd_pcm_sw_params_set_stop_threshold as ma_proc
		snd_pcm_sw_params as ma_proc
		snd_pcm_format_mask_sizeof as ma_proc
		snd_pcm_format_mask_test as ma_proc
		snd_pcm_get_chmap as ma_proc
		snd_pcm_state as ma_proc
		snd_pcm_prepare as ma_proc
		snd_pcm_start as ma_proc
		snd_pcm_drop as ma_proc
		snd_pcm_drain as ma_proc
		snd_pcm_reset as ma_proc
		snd_device_name_hint as ma_proc
		snd_device_name_get_hint as ma_proc
		snd_card_get_index as ma_proc
		snd_device_name_free_hint as ma_proc
		snd_pcm_mmap_begin as ma_proc
		snd_pcm_mmap_commit as ma_proc
		snd_pcm_recover as ma_proc
		snd_pcm_readi as ma_proc
		snd_pcm_writei as ma_proc
		snd_pcm_avail as ma_proc
		snd_pcm_avail_update as ma_proc
		snd_pcm_wait as ma_proc
		snd_pcm_nonblock as ma_proc
		snd_pcm_info as ma_proc
		snd_pcm_info_sizeof as ma_proc
		snd_pcm_info_get_name as ma_proc
		snd_pcm_poll_descriptors as ma_proc
		snd_pcm_poll_descriptors_count as ma_proc
		snd_pcm_poll_descriptors_revents as ma_proc
		snd_config_update_free_global as ma_proc
		internalDeviceEnumLock as ma_mutex
		useVerboseDeviceEnumeration as ma_bool32
	end type
#endif

#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
	type ma_context_pulse
		pulseSO as ma_handle
		pa_mainloop_new as ma_proc
		pa_mainloop_free as ma_proc
		pa_mainloop_quit as ma_proc
		pa_mainloop_get_api as ma_proc
		pa_mainloop_iterate as ma_proc
		pa_mainloop_wakeup as ma_proc
		pa_threaded_mainloop_new as ma_proc
		pa_threaded_mainloop_free as ma_proc
		pa_threaded_mainloop_start as ma_proc
		pa_threaded_mainloop_stop as ma_proc
		pa_threaded_mainloop_lock as ma_proc
		pa_threaded_mainloop_unlock as ma_proc
		pa_threaded_mainloop_wait as ma_proc
		pa_threaded_mainloop_signal as ma_proc
		pa_threaded_mainloop_accept as ma_proc
		pa_threaded_mainloop_get_retval as ma_proc
		pa_threaded_mainloop_get_api as ma_proc
		pa_threaded_mainloop_in_thread as ma_proc
		pa_threaded_mainloop_set_name as ma_proc
		pa_context_new as ma_proc
		pa_context_unref as ma_proc
		pa_context_connect as ma_proc
		pa_context_disconnect as ma_proc
		pa_context_set_state_callback as ma_proc
		pa_context_get_state as ma_proc
		pa_context_get_sink_info_list as ma_proc
		pa_context_get_source_info_list as ma_proc
		pa_context_get_sink_info_by_name as ma_proc
		pa_context_get_source_info_by_name as ma_proc
		pa_operation_unref as ma_proc
		pa_operation_get_state as ma_proc
		pa_channel_map_init_extend as ma_proc
		pa_channel_map_valid as ma_proc
		pa_channel_map_compatible as ma_proc
		pa_stream_new as ma_proc
		pa_stream_unref as ma_proc
		pa_stream_connect_playback as ma_proc
		pa_stream_connect_record as ma_proc
		pa_stream_disconnect as ma_proc
		pa_stream_get_state as ma_proc
		pa_stream_get_sample_spec as ma_proc
		pa_stream_get_channel_map as ma_proc
		pa_stream_get_buffer_attr as ma_proc
		pa_stream_set_buffer_attr as ma_proc
		pa_stream_get_device_name as ma_proc
		pa_stream_set_write_callback as ma_proc
		pa_stream_set_read_callback as ma_proc
		pa_stream_set_suspended_callback as ma_proc
		pa_stream_set_moved_callback as ma_proc
		pa_stream_is_suspended as ma_proc
		pa_stream_flush as ma_proc
		pa_stream_drain as ma_proc
		pa_stream_is_corked as ma_proc
		pa_stream_cork as ma_proc
		pa_stream_trigger as ma_proc
		pa_stream_begin_write as ma_proc
		pa_stream_write as ma_proc
		pa_stream_peek as ma_proc
		pa_stream_drop as ma_proc
		pa_stream_writable_size as ma_proc
		pa_stream_readable_size as ma_proc
		pMainLoop as ma_ptr
		pPulseContext as ma_ptr
		pApplicationName as zstring ptr
		pServerName as zstring ptr
	end type
#elseif defined(__FB_WIN32__)
	type ma_context_wasapi
		commandThread as ma_thread
		commandLock as ma_mutex
		commandSem as ma_semaphore
		commandIndex as ma_uint32
		commandCount as ma_uint32
		commands(0 to 3) as ma_context_command__wasapi
	end type

	type ma_context_dsound
		hDSoundDLL as ma_handle
		DirectSoundCreate as ma_proc
		DirectSoundEnumerateA as ma_proc
		DirectSoundCaptureCreate as ma_proc
		DirectSoundCaptureEnumerateA as ma_proc
	end type

	type ma_context_winmm
		hWinMM as ma_handle
		waveOutGetNumDevs as ma_proc
		waveOutGetDevCapsA as ma_proc
		waveOutOpen as ma_proc
		waveOutClose as ma_proc
		waveOutPrepareHeader as ma_proc
		waveOutUnprepareHeader as ma_proc
		waveOutWrite as ma_proc
		waveOutReset as ma_proc
		waveInGetNumDevs as ma_proc
		waveInGetDevCapsA as ma_proc
		waveInOpen as ma_proc
		waveInClose as ma_proc
		waveInPrepareHeader as ma_proc
		waveInUnprepareHeader as ma_proc
		waveInAddBuffer as ma_proc
		waveInStart as ma_proc
		waveInReset as ma_proc
	end type
#endif

#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
	type ma_context_jack
		jackSO as ma_handle
		jack_client_open as ma_proc
		jack_client_close as ma_proc
		jack_client_name_size as ma_proc
		jack_set_process_callback as ma_proc
		jack_set_buffer_size_callback as ma_proc
		jack_on_shutdown as ma_proc
		jack_get_sample_rate as ma_proc
		jack_get_buffer_size as ma_proc
		jack_get_ports as ma_proc
		jack_activate as ma_proc
		jack_deactivate as ma_proc
		jack_connect as ma_proc
		jack_port_register as ma_proc
		jack_port_name as ma_proc
		jack_port_get_buffer as ma_proc
		jack_free as ma_proc
		pClientName as zstring ptr
		tryStartServer as ma_bool32
	end type
#elseif defined(__FB_FREEBSD__)
	type ma_context_oss
		versionMajor as long
		versionMinor as long
	end type
#elseif defined(__FB_OPENBSD__)
	type ma_context_sndio
		sndioSO as ma_handle
		sio_open as ma_proc
		sio_close as ma_proc
		sio_setpar as ma_proc
		sio_getpar as ma_proc
		sio_getcap as ma_proc
		sio_start as ma_proc
		sio_stop as ma_proc
		sio_read as ma_proc
		sio_write as ma_proc
		sio_onmove as ma_proc
		sio_nfds as ma_proc
		sio_pollfd as ma_proc
		sio_revents as ma_proc
		sio_eof as ma_proc
		sio_setvol as ma_proc
		sio_onvol as ma_proc
		sio_initpar as ma_proc
	end type
#endif

#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
	type ma_context_audio4
		_unused as long
	end type
#elseif defined(__FB_DARWIN__)
	type ma_context_coreaudio
		hCoreFoundation as ma_handle
		CFStringGetCString as ma_proc
		CFRelease as ma_proc
		hCoreAudio as ma_handle
		AudioObjectGetPropertyData as ma_proc
		AudioObjectGetPropertyDataSize as ma_proc
		AudioObjectSetPropertyData as ma_proc
		AudioObjectAddPropertyListener as ma_proc
		AudioObjectRemovePropertyListener as ma_proc
		hAudioUnit as ma_handle
		AudioComponentFindNext as ma_proc
		AudioComponentInstanceDispose as ma_proc
		AudioComponentInstanceNew as ma_proc
		AudioOutputUnitStart as ma_proc
		AudioOutputUnitStop as ma_proc
		AudioUnitAddPropertyListener as ma_proc
		AudioUnitGetPropertyInfo as ma_proc
		AudioUnitGetProperty as ma_proc
		AudioUnitSetProperty as ma_proc
		AudioUnitInitialize as ma_proc
		AudioUnitRender as ma_proc
		component as ma_ptr
		noAudioSessionDeactivate as ma_bool32
	end type
#endif

type ma_context_null_backend
	_unused as long
end type

#ifdef __FB_WIN32__
	type ma_context_win32
		hOle32DLL as ma_handle
		CoInitializeEx as ma_proc
		CoUninitialize as ma_proc
		CoCreateInstance as ma_proc
		CoTaskMemFree as ma_proc
		PropVariantClear as ma_proc
		StringFromGUID2 as ma_proc
		hUser32DLL as ma_handle
		GetForegroundWindow as ma_proc
		GetDesktopWindow as ma_proc
		hAdvapi32DLL as ma_handle
		RegOpenKeyExA as ma_proc
		RegCloseKey as ma_proc
		RegQueryValueExA as ma_proc
	end type
#else
	type ma_context_posix
		pthreadSO as ma_handle
		pthread_create as ma_proc
		pthread_join as ma_proc
		pthread_mutex_init as ma_proc
		pthread_mutex_destroy as ma_proc
		pthread_mutex_lock as ma_proc
		pthread_mutex_unlock as ma_proc
		pthread_cond_init as ma_proc
		pthread_cond_destroy as ma_proc
		pthread_cond_wait as ma_proc
		pthread_cond_signal as ma_proc
		pthread_attr_init as ma_proc
		pthread_attr_destroy as ma_proc
		pthread_attr_setschedpolicy as ma_proc
		pthread_attr_getschedparam as ma_proc
		pthread_attr_setschedparam as ma_proc
	end type
#endif

type ma_context_
	callbacks as ma_backend_callbacks
	backend as ma_backend
	pLog as ma_log ptr
	log as ma_log
	threadPriority as ma_thread_priority
	threadStackSize as uinteger
	pUserData as any ptr
	allocationCallbacks as ma_allocation_callbacks
	deviceEnumLock as ma_mutex
	deviceInfoLock as ma_mutex
	deviceInfoCapacity as ma_uint32
	playbackDeviceInfoCount as ma_uint32
	captureDeviceInfoCount as ma_uint32
	pDeviceInfos as ma_device_info ptr

	union
		#ifdef __FB_LINUX__
			alsa as ma_context_alsa
		#endif

		#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
			pulse as ma_context_pulse
		#elseif defined(__FB_WIN32__)
			wasapi as ma_context_wasapi
			dsound as ma_context_dsound
			winmm as ma_context_winmm
		#endif

		#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
			jack as ma_context_jack
		#elseif defined(__FB_FREEBSD__)
			oss as ma_context_oss
		#elseif defined(__FB_OPENBSD__)
			sndio as ma_context_sndio
		#endif

		#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
			audio4 as ma_context_audio4
		#elseif defined(__FB_DARWIN__)
			coreaudio as ma_context_coreaudio
		#endif

		null_backend as ma_context_null_backend
	end union

	union
		#ifdef __FB_WIN32__
			win32_ as ma_context_win32
		#else
			posix as ma_context_posix
		#endif

		_unused as long
	end union
end type

type ma_device_resampling_linear
	lpfOrder as ma_uint32
end type

type ma_device_resampling
	algorithm as ma_resample_algorithm
	pBackendVTable as ma_resampling_backend_vtable ptr
	pBackendUserData as any ptr
	linear as ma_device_resampling_linear
end type

type ma_device_playback
	pID as ma_device_id ptr
	id as ma_device_id
	name as zstring * 255 + 1
	shareMode as ma_share_mode
	format as ma_format
	channels as ma_uint32
	channelMap(0 to 253) as ma_channel
	internalFormat as ma_format
	internalChannels as ma_uint32
	internalSampleRate as ma_uint32
	internalChannelMap(0 to 253) as ma_channel
	internalPeriodSizeInFrames as ma_uint32
	internalPeriods as ma_uint32
	channelMixMode as ma_channel_mix_mode
	converter as ma_data_converter
	pIntermediaryBuffer as any ptr
	intermediaryBufferCap as ma_uint32
	intermediaryBufferLen as ma_uint32
	pInputCache as any ptr
	inputCacheCap as ma_uint64
	inputCacheConsumed as ma_uint64
	inputCacheRemaining as ma_uint64
end type

type ma_device_capture
	pID as ma_device_id ptr
	id as ma_device_id
	name as zstring * 255 + 1
	shareMode as ma_share_mode
	format as ma_format
	channels as ma_uint32
	channelMap(0 to 253) as ma_channel
	internalFormat as ma_format
	internalChannels as ma_uint32
	internalSampleRate as ma_uint32
	internalChannelMap(0 to 253) as ma_channel
	internalPeriodSizeInFrames as ma_uint32
	internalPeriods as ma_uint32
	channelMixMode as ma_channel_mix_mode
	converter as ma_data_converter
	pIntermediaryBuffer as any ptr
	intermediaryBufferCap as ma_uint32
	intermediaryBufferLen as ma_uint32
end type

#ifdef __FB_LINUX__
	type ma_device_alsa
		pPCMPlayback as ma_ptr
		pPCMCapture as ma_ptr
		pPollDescriptorsPlayback as any ptr
		pPollDescriptorsCapture as any ptr
		pollDescriptorCountPlayback as long
		pollDescriptorCountCapture as long
		wakeupfdPlayback as long
		wakeupfdCapture as long
		isUsingMMapPlayback as ma_bool8
		isUsingMMapCapture as ma_bool8
	end type
#endif

#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
	type ma_device_pulse
		pMainLoop as ma_ptr
		pPulseContext as ma_ptr
		pStreamPlayback as ma_ptr
		pStreamCapture as ma_ptr
	end type
#elseif defined(__FB_WIN32__)
	type ma_device_wasapi
		pAudioClientPlayback as ma_ptr
		pAudioClientCapture as ma_ptr
		pRenderClient as ma_ptr
		pCaptureClient as ma_ptr
		pDeviceEnumerator as ma_ptr
		notificationClient as ma_IMMNotificationClient
		hEventPlayback as ma_handle
		hEventCapture as ma_handle
		actualBufferSizeInFramesPlayback as ma_uint32
		actualBufferSizeInFramesCapture as ma_uint32
		originalPeriodSizeInFrames as ma_uint32
		originalPeriodSizeInMilliseconds as ma_uint32
		originalPeriods as ma_uint32
		originalPerformanceProfile as ma_performance_profile
		periodSizeInFramesPlayback as ma_uint32
		periodSizeInFramesCapture as ma_uint32
		pMappedBufferCapture as any ptr
		mappedBufferCaptureCap as ma_uint32
		mappedBufferCaptureLen as ma_uint32
		pMappedBufferPlayback as any ptr
		mappedBufferPlaybackCap as ma_uint32
		mappedBufferPlaybackLen as ma_uint32
		isStartedCapture as ma_bool32
		isStartedPlayback as ma_bool32
		noAutoConvertSRC as ma_bool8
		noDefaultQualitySRC as ma_bool8
		noHardwareOffloading as ma_bool8
		allowCaptureAutoStreamRouting as ma_bool8
		allowPlaybackAutoStreamRouting as ma_bool8
		isDetachedPlayback as ma_bool8
		isDetachedCapture as ma_bool8
	end type

	type ma_device_dsound
		pPlayback as ma_ptr
		pPlaybackPrimaryBuffer as ma_ptr
		pPlaybackBuffer as ma_ptr
		pCapture as ma_ptr
		pCaptureBuffer as ma_ptr
	end type

	type ma_device_winmm
		hDevicePlayback as ma_handle
		hDeviceCapture as ma_handle
		hEventPlayback as ma_handle
		hEventCapture as ma_handle
		fragmentSizeInFrames as ma_uint32
		iNextHeaderPlayback as ma_uint32
		iNextHeaderCapture as ma_uint32
		headerFramesConsumedPlayback as ma_uint32
		headerFramesConsumedCapture as ma_uint32
		pWAVEHDRPlayback as ma_uint8 ptr
		pWAVEHDRCapture as ma_uint8 ptr
		pIntermediaryBufferPlayback as ma_uint8 ptr
		pIntermediaryBufferCapture as ma_uint8 ptr
		_pHeapData as ma_uint8 ptr
	end type
#endif

#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
	type ma_device_jack
		pClient as ma_ptr
		ppPortsPlayback as ma_ptr ptr
		ppPortsCapture as ma_ptr ptr
		pIntermediaryBufferPlayback as single ptr
		pIntermediaryBufferCapture as single ptr
	end type
#elseif defined(__FB_FREEBSD__)
	type ma_device_oss
		fdPlayback as long
		fdCapture as long
	end type
#elseif defined(__FB_OPENBSD__)
	type ma_device_sndio
		handlePlayback as ma_ptr
		handleCapture as ma_ptr
		isStartedPlayback as ma_bool32
		isStartedCapture as ma_bool32
	end type
#endif

#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
	type ma_device_audio4
		fdPlayback as long
		fdCapture as long
	end type
#elseif defined(__FB_DARWIN__)
	type ma_device_coreaudio
		deviceObjectIDPlayback as ma_uint32
		deviceObjectIDCapture as ma_uint32
		audioUnitPlayback as ma_ptr
		audioUnitCapture as ma_ptr
		pAudioBufferList as ma_ptr
		audioBufferCapInFrames as ma_uint32
		stopEvent as ma_event
		originalPeriodSizeInFrames as ma_uint32
		originalPeriodSizeInMilliseconds as ma_uint32
		originalPeriods as ma_uint32
		originalPerformanceProfile as ma_performance_profile
		isDefaultPlaybackDevice as ma_bool32
		isDefaultCaptureDevice as ma_bool32
		isSwitchingPlaybackDevice as ma_bool32
		isSwitchingCaptureDevice as ma_bool32
		pNotificationHandler as any ptr
	end type
#endif

type ma_device_null_device
	deviceThread as ma_thread
	operationEvent as ma_event
	operationCompletionEvent as ma_event
	operationSemaphore as ma_semaphore
	operation as ma_uint32
	operationResult as ma_result
	timer as ma_timer
	priorRunTime as double
	currentPeriodFramesRemainingPlayback as ma_uint32
	currentPeriodFramesRemainingCapture as ma_uint32
	lastProcessedFramePlayback as ma_uint64
	lastProcessedFrameCapture as ma_uint64
	isStarted as ma_bool32
end type

type ma_device_
	pContext as ma_context ptr
	as ma_device_type type
	sampleRate as ma_uint32
	state as ma_device_state
	onData as ma_device_data_proc
	onNotification as ma_device_notification_proc
	onStop as ma_stop_proc
	pUserData as any ptr
	startStopLock as ma_mutex
	wakeupEvent as ma_event
	startEvent as ma_event
	stopEvent as ma_event
	thread as ma_thread
	workResult as ma_result
	isOwnerOfContext as ma_bool8
	noPreSilencedOutputBuffer as ma_bool8
	noClip as ma_bool8
	noDisableDenormals as ma_bool8
	noFixedSizedCallback as ma_bool8
	masterVolumeFactor as single
	duplexRB as ma_duplex_rb
	resampling as ma_device_resampling
	playback as ma_device_playback
	capture as ma_device_capture

	union
		#ifdef __FB_LINUX__
			alsa as ma_device_alsa
		#endif

		#if defined(__FB_LINUX__) or defined(__FB_DARWIN__) or defined(__FB_CYGWIN__)
			pulse as ma_device_pulse
		#elseif defined(__FB_WIN32__)
			wasapi as ma_device_wasapi
			dsound as ma_device_dsound
			winmm as ma_device_winmm
		#endif

		#if defined(__FB_DARWIN__) or defined(__FB_WIN32__) or defined(__FB_CYGWIN__) or defined(__FB_LINUX__)
			jack as ma_device_jack
		#elseif defined(__FB_FREEBSD__)
			oss as ma_device_oss
		#elseif defined(__FB_OPENBSD__)
			sndio as ma_device_sndio
		#endif

		#if defined(__FB_OPENBSD__) or defined(__FB_NETBSD__)
			audio4 as ma_device_audio4
		#elseif defined(__FB_DARWIN__)
			coreaudio as ma_device_coreaudio
		#endif

		null_device as ma_device_null_device
	end union
end type

declare function ma_context_config_init() as ma_context_config
declare function ma_context_init(byval backends as const ma_backend ptr, byval backendCount as ma_uint32, byval pConfig as const ma_context_config ptr, byval pContext as ma_context ptr) as ma_result
declare function ma_context_uninit(byval pContext as ma_context ptr) as ma_result
declare function ma_context_sizeof() as uinteger
declare function ma_context_get_log(byval pContext as ma_context ptr) as ma_log ptr
declare function ma_context_enumerate_devices(byval pContext as ma_context ptr, byval callback as ma_enum_devices_callback_proc, byval pUserData as any ptr) as ma_result
declare function ma_context_get_devices(byval pContext as ma_context ptr, byval ppPlaybackDeviceInfos as ma_device_info ptr ptr, byval pPlaybackDeviceCount as ma_uint32 ptr, byval ppCaptureDeviceInfos as ma_device_info ptr ptr, byval pCaptureDeviceCount as ma_uint32 ptr) as ma_result
declare function ma_context_get_device_info(byval pContext as ma_context ptr, byval deviceType as ma_device_type, byval pDeviceID as const ma_device_id ptr, byval pDeviceInfo as ma_device_info ptr) as ma_result
declare function ma_context_is_loopback_supported(byval pContext as ma_context ptr) as ma_bool32
declare function ma_device_config_init(byval deviceType as ma_device_type) as ma_device_config
declare function ma_device_init(byval pContext as ma_context ptr, byval pConfig as const ma_device_config ptr, byval pDevice as ma_device ptr) as ma_result
declare function ma_device_init_ex(byval backends as const ma_backend ptr, byval backendCount as ma_uint32, byval pContextConfig as const ma_context_config ptr, byval pConfig as const ma_device_config ptr, byval pDevice as ma_device ptr) as ma_result
declare sub ma_device_uninit(byval pDevice as ma_device ptr)
declare function ma_device_get_context(byval pDevice as ma_device ptr) as ma_context ptr
declare function ma_device_get_log(byval pDevice as ma_device ptr) as ma_log ptr
declare function ma_device_get_info(byval pDevice as ma_device ptr, byval type as ma_device_type, byval pDeviceInfo as ma_device_info ptr) as ma_result
declare function ma_device_get_name(byval pDevice as ma_device ptr, byval type as ma_device_type, byval pName as zstring ptr, byval nameCap as uinteger, byval pLengthNotIncludingNullTerminator as uinteger ptr) as ma_result
declare function ma_device_start(byval pDevice as ma_device ptr) as ma_result
declare function ma_device_stop(byval pDevice as ma_device ptr) as ma_result
declare function ma_device_is_started(byval pDevice as const ma_device ptr) as ma_bool32
declare function ma_device_get_state(byval pDevice as const ma_device ptr) as ma_device_state
declare function ma_device_post_init(byval pDevice as ma_device ptr, byval deviceType as ma_device_type, byval pPlaybackDescriptor as const ma_device_descriptor ptr, byval pCaptureDescriptor as const ma_device_descriptor ptr) as ma_result
declare function ma_device_set_master_volume(byval pDevice as ma_device ptr, byval volume as single) as ma_result
declare function ma_device_get_master_volume(byval pDevice as ma_device ptr, byval pVolume as single ptr) as ma_result
declare function ma_device_set_master_volume_db(byval pDevice as ma_device ptr, byval gainDB as single) as ma_result
declare function ma_device_get_master_volume_db(byval pDevice as ma_device ptr, byval pGainDB as single ptr) as ma_result
declare function ma_device_handle_backend_data_callback(byval pDevice as ma_device ptr, byval pOutput as any ptr, byval pInput as const any ptr, byval frameCount as ma_uint32) as ma_result
declare function ma_calculate_buffer_size_in_frames_from_descriptor(byval pDescriptor as const ma_device_descriptor ptr, byval nativeSampleRate as ma_uint32, byval performanceProfile as ma_performance_profile) as ma_uint32
declare function ma_get_backend_name(byval backend as ma_backend) as const zstring ptr
declare function ma_is_backend_enabled(byval backend as ma_backend) as ma_bool32
declare function ma_get_enabled_backends(byval pBackends as ma_backend ptr, byval backendCap as uinteger, byval pBackendCount as uinteger ptr) as ma_result
declare function ma_is_loopback_supported(byval backend as ma_backend) as ma_bool32
declare function ma_calculate_buffer_size_in_milliseconds_from_frames(byval bufferSizeInFrames as ma_uint32, byval sampleRate as ma_uint32) as ma_uint32
declare function ma_calculate_buffer_size_in_frames_from_milliseconds(byval bufferSizeInMilliseconds as ma_uint32, byval sampleRate as ma_uint32) as ma_uint32
declare sub ma_copy_pcm_frames(byval dst as any ptr, byval src as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32)
declare sub ma_silence_pcm_frames(byval p as any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32)
declare function ma_offset_pcm_frames_ptr(byval p as any ptr, byval offsetInFrames as ma_uint64, byval format as ma_format, byval channels as ma_uint32) as any ptr
declare function ma_offset_pcm_frames_const_ptr(byval p as const any ptr, byval offsetInFrames as ma_uint64, byval format as ma_format, byval channels as ma_uint32) as const any ptr
#define ma_offset_pcm_frames_ptr_f32(p, offsetInFrames, channels) cptr(single ptr, ma_offset_pcm_frames_ptr(cptr(any ptr, (p)), (offsetInFrames), ma_format_f32, (channels)))
#define ma_offset_pcm_frames_const_ptr_f32(p, offsetInFrames, channels) cptr(const single ptr, ma_offset_pcm_frames_const_ptr(cptr(const any ptr, (p)), (offsetInFrames), ma_format_f32, (channels)))
declare sub ma_clip_samples_u8(byval pDst as ma_uint8 ptr, byval pSrc as const ma_int16 ptr, byval count as ma_uint64)
declare sub ma_clip_samples_s16(byval pDst as ma_int16 ptr, byval pSrc as const ma_int32 ptr, byval count as ma_uint64)
declare sub ma_clip_samples_s24(byval pDst as ma_uint8 ptr, byval pSrc as const ma_int64 ptr, byval count as ma_uint64)
declare sub ma_clip_samples_s32(byval pDst as ma_int32 ptr, byval pSrc as const ma_int64 ptr, byval count as ma_uint64)
declare sub ma_clip_samples_f32(byval pDst as single ptr, byval pSrc as const single ptr, byval count as ma_uint64)
declare sub ma_clip_pcm_frames(byval pDst as any ptr, byval pSrc as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32)
declare sub ma_copy_and_apply_volume_factor_u8(byval pSamplesOut as ma_uint8 ptr, byval pSamplesIn as const ma_uint8 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_s16(byval pSamplesOut as ma_int16 ptr, byval pSamplesIn as const ma_int16 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_s24(byval pSamplesOut as any ptr, byval pSamplesIn as const any ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_s32(byval pSamplesOut as ma_int32 ptr, byval pSamplesIn as const ma_int32 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_f32(byval pSamplesOut as single ptr, byval pSamplesIn as const single ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_apply_volume_factor_u8(byval pSamples as ma_uint8 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_apply_volume_factor_s16(byval pSamples as ma_int16 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_apply_volume_factor_s24(byval pSamples as any ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_apply_volume_factor_s32(byval pSamples as ma_int32 ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_apply_volume_factor_f32(byval pSamples as single ptr, byval sampleCount as ma_uint64, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames_u8(byval pFramesOut as ma_uint8 ptr, byval pFramesIn as const ma_uint8 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames_s16(byval pFramesOut as ma_int16 ptr, byval pFramesIn as const ma_int16 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames_s24(byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames_s32(byval pFramesOut as ma_int32 ptr, byval pFramesIn as const ma_int32 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames_f32(byval pFramesOut as single ptr, byval pFramesIn as const single ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_pcm_frames(byval pFramesOut as any ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames_u8(byval pFrames as ma_uint8 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames_s16(byval pFrames as ma_int16 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames_s24(byval pFrames as any ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames_s32(byval pFrames as ma_int32 ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames_f32(byval pFrames as single ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval factor as single)
declare sub ma_apply_volume_factor_pcm_frames(byval pFrames as any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32, byval factor as single)
declare sub ma_copy_and_apply_volume_factor_per_channel_f32(byval pFramesOut as single ptr, byval pFramesIn as const single ptr, byval frameCount as ma_uint64, byval channels as ma_uint32, byval pChannelGains as single ptr)
declare sub ma_copy_and_apply_volume_and_clip_samples_u8(byval pDst as ma_uint8 ptr, byval pSrc as const ma_int16 ptr, byval count as ma_uint64, byval volume as single)
declare sub ma_copy_and_apply_volume_and_clip_samples_s16(byval pDst as ma_int16 ptr, byval pSrc as const ma_int32 ptr, byval count as ma_uint64, byval volume as single)
declare sub ma_copy_and_apply_volume_and_clip_samples_s24(byval pDst as ma_uint8 ptr, byval pSrc as const ma_int64 ptr, byval count as ma_uint64, byval volume as single)
declare sub ma_copy_and_apply_volume_and_clip_samples_s32(byval pDst as ma_int32 ptr, byval pSrc as const ma_int64 ptr, byval count as ma_uint64, byval volume as single)
declare sub ma_copy_and_apply_volume_and_clip_samples_f32(byval pDst as single ptr, byval pSrc as const single ptr, byval count as ma_uint64, byval volume as single)
declare sub ma_copy_and_apply_volume_and_clip_pcm_frames(byval pDst as any ptr, byval pSrc as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32, byval volume as single)
declare function ma_volume_linear_to_db(byval factor as single) as single
declare function ma_volume_db_to_linear(byval gain as single) as single
type ma_data_source as any
const MA_DATA_SOURCE_SELF_MANAGED_RANGE_AND_LOOP_POINT = &h00000001

type ma_data_source_vtable
	onRead as function(byval pDataSource as ma_data_source ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
	onSeek as function(byval pDataSource as ma_data_source ptr, byval frameIndex as ma_uint64) as ma_result
	onGetDataFormat as function(byval pDataSource as ma_data_source ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
	onGetCursor as function(byval pDataSource as ma_data_source ptr, byval pCursor as ma_uint64 ptr) as ma_result
	onGetLength as function(byval pDataSource as ma_data_source ptr, byval pLength as ma_uint64 ptr) as ma_result
	onSetLooping as function(byval pDataSource as ma_data_source ptr, byval isLooping as ma_bool32) as ma_result
	flags as ma_uint32
end type

type ma_data_source_get_next_proc as function(byval pDataSource as ma_data_source ptr) as ma_data_source ptr

type ma_data_source_config
	vtable as const ma_data_source_vtable ptr
end type

declare function ma_data_source_config_init() as ma_data_source_config

type ma_data_source_base
	vtable as const ma_data_source_vtable ptr
	rangeBegInFrames as ma_uint64
	rangeEndInFrames as ma_uint64
	loopBegInFrames as ma_uint64
	loopEndInFrames as ma_uint64
	pCurrent as ma_data_source ptr
	pNext as ma_data_source ptr
	onGetNext as ma_data_source_get_next_proc
	isLooping as ma_bool32
end type

declare function ma_data_source_init(byval pConfig as const ma_data_source_config ptr, byval pDataSource as ma_data_source ptr) as ma_result
declare sub ma_data_source_uninit(byval pDataSource as ma_data_source ptr)
declare function ma_data_source_read_pcm_frames(byval pDataSource as ma_data_source ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_data_source_seek_pcm_frames(byval pDataSource as ma_data_source ptr, byval frameCount as ma_uint64, byval pFramesSeeked as ma_uint64 ptr) as ma_result
declare function ma_data_source_seek_to_pcm_frame(byval pDataSource as ma_data_source ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_data_source_get_data_format(byval pDataSource as ma_data_source ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_data_source_get_cursor_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_data_source_get_length_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_data_source_get_cursor_in_seconds(byval pDataSource as ma_data_source ptr, byval pCursor as single ptr) as ma_result
declare function ma_data_source_get_length_in_seconds(byval pDataSource as ma_data_source ptr, byval pLength as single ptr) as ma_result
declare function ma_data_source_set_looping(byval pDataSource as ma_data_source ptr, byval isLooping as ma_bool32) as ma_result
declare function ma_data_source_is_looping(byval pDataSource as ma_data_source ptr) as ma_bool32
declare function ma_data_source_set_range_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval rangeBegInFrames as ma_uint64, byval rangeEndInFrames as ma_uint64) as ma_result
declare sub ma_data_source_get_range_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval pRangeBegInFrames as ma_uint64 ptr, byval pRangeEndInFrames as ma_uint64 ptr)
declare function ma_data_source_set_loop_point_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval loopBegInFrames as ma_uint64, byval loopEndInFrames as ma_uint64) as ma_result
declare sub ma_data_source_get_loop_point_in_pcm_frames(byval pDataSource as ma_data_source ptr, byval pLoopBegInFrames as ma_uint64 ptr, byval pLoopEndInFrames as ma_uint64 ptr)
declare function ma_data_source_set_current(byval pDataSource as ma_data_source ptr, byval pCurrentDataSource as ma_data_source ptr) as ma_result
declare function ma_data_source_get_current(byval pDataSource as ma_data_source ptr) as ma_data_source ptr
declare function ma_data_source_set_next(byval pDataSource as ma_data_source ptr, byval pNextDataSource as ma_data_source ptr) as ma_result
declare function ma_data_source_get_next(byval pDataSource as ma_data_source ptr) as ma_data_source ptr
declare function ma_data_source_set_next_callback(byval pDataSource as ma_data_source ptr, byval onGetNext as ma_data_source_get_next_proc) as ma_result
declare function ma_data_source_get_next_callback(byval pDataSource as ma_data_source ptr) as ma_data_source_get_next_proc

type ma_audio_buffer_ref
	ds as ma_data_source_base
	format as ma_format
	channels as ma_uint32
	cursor as ma_uint64
	sizeInFrames as ma_uint64
	pData as const any ptr
end type

declare function ma_audio_buffer_ref_init(byval format as ma_format, byval channels as ma_uint32, byval pData as const any ptr, byval sizeInFrames as ma_uint64, byval pAudioBufferRef as ma_audio_buffer_ref ptr) as ma_result
declare sub ma_audio_buffer_ref_uninit(byval pAudioBufferRef as ma_audio_buffer_ref ptr)
declare function ma_audio_buffer_ref_set_data(byval pAudioBufferRef as ma_audio_buffer_ref ptr, byval pData as const any ptr, byval sizeInFrames as ma_uint64) as ma_result
declare function ma_audio_buffer_ref_read_pcm_frames(byval pAudioBufferRef as ma_audio_buffer_ref ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval loop as ma_bool32) as ma_uint64
declare function ma_audio_buffer_ref_seek_to_pcm_frame(byval pAudioBufferRef as ma_audio_buffer_ref ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_audio_buffer_ref_map(byval pAudioBufferRef as ma_audio_buffer_ref ptr, byval ppFramesOut as any ptr ptr, byval pFrameCount as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_ref_unmap(byval pAudioBufferRef as ma_audio_buffer_ref ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_audio_buffer_ref_at_end(byval pAudioBufferRef as const ma_audio_buffer_ref ptr) as ma_bool32
declare function ma_audio_buffer_ref_get_cursor_in_pcm_frames(byval pAudioBufferRef as const ma_audio_buffer_ref ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_ref_get_length_in_pcm_frames(byval pAudioBufferRef as const ma_audio_buffer_ref ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_ref_get_available_frames(byval pAudioBufferRef as const ma_audio_buffer_ref ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result

type ma_audio_buffer_config
	format as ma_format
	channels as ma_uint32
	sizeInFrames as ma_uint64
	pData as const any ptr
	allocationCallbacks as ma_allocation_callbacks
end type

declare function ma_audio_buffer_config_init(byval format as ma_format, byval channels as ma_uint32, byval sizeInFrames as ma_uint64, byval pData as const any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as ma_audio_buffer_config

type ma_audio_buffer
	ref as ma_audio_buffer_ref
	allocationCallbacks as ma_allocation_callbacks
	ownsData as ma_bool32
	_pExtraData(0 to 0) as ma_uint8
end type

declare function ma_audio_buffer_init(byval pConfig as const ma_audio_buffer_config ptr, byval pAudioBuffer as ma_audio_buffer ptr) as ma_result
declare function ma_audio_buffer_init_copy(byval pConfig as const ma_audio_buffer_config ptr, byval pAudioBuffer as ma_audio_buffer ptr) as ma_result
declare function ma_audio_buffer_alloc_and_init(byval pConfig as const ma_audio_buffer_config ptr, byval ppAudioBuffer as ma_audio_buffer ptr ptr) as ma_result
declare sub ma_audio_buffer_uninit(byval pAudioBuffer as ma_audio_buffer ptr)
declare sub ma_audio_buffer_uninit_and_free(byval pAudioBuffer as ma_audio_buffer ptr)
declare function ma_audio_buffer_read_pcm_frames(byval pAudioBuffer as ma_audio_buffer ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval loop as ma_bool32) as ma_uint64
declare function ma_audio_buffer_seek_to_pcm_frame(byval pAudioBuffer as ma_audio_buffer ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_audio_buffer_map(byval pAudioBuffer as ma_audio_buffer ptr, byval ppFramesOut as any ptr ptr, byval pFrameCount as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_unmap(byval pAudioBuffer as ma_audio_buffer ptr, byval frameCount as ma_uint64) as ma_result
declare function ma_audio_buffer_at_end(byval pAudioBuffer as const ma_audio_buffer ptr) as ma_bool32
declare function ma_audio_buffer_get_cursor_in_pcm_frames(byval pAudioBuffer as const ma_audio_buffer ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_get_length_in_pcm_frames(byval pAudioBuffer as const ma_audio_buffer ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_audio_buffer_get_available_frames(byval pAudioBuffer as const ma_audio_buffer ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result

type ma_paged_audio_buffer_page
	pNext as ma_paged_audio_buffer_page ptr
	sizeInFrames as ma_uint64
	pAudioData(0 to 0) as ma_uint8
end type

type ma_paged_audio_buffer_data
	format as ma_format
	channels as ma_uint32
	head as ma_paged_audio_buffer_page
	pTail as ma_paged_audio_buffer_page ptr
end type

declare function ma_paged_audio_buffer_data_init(byval format as ma_format, byval channels as ma_uint32, byval pData as ma_paged_audio_buffer_data ptr) as ma_result
declare sub ma_paged_audio_buffer_data_uninit(byval pData as ma_paged_audio_buffer_data ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_paged_audio_buffer_data_get_head(byval pData as ma_paged_audio_buffer_data ptr) as ma_paged_audio_buffer_page ptr
declare function ma_paged_audio_buffer_data_get_tail(byval pData as ma_paged_audio_buffer_data ptr) as ma_paged_audio_buffer_page ptr
declare function ma_paged_audio_buffer_data_get_length_in_pcm_frames(byval pData as ma_paged_audio_buffer_data ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_paged_audio_buffer_data_allocate_page(byval pData as ma_paged_audio_buffer_data ptr, byval pageSizeInFrames as ma_uint64, byval pInitialData as const any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval ppPage as ma_paged_audio_buffer_page ptr ptr) as ma_result
declare function ma_paged_audio_buffer_data_free_page(byval pData as ma_paged_audio_buffer_data ptr, byval pPage as ma_paged_audio_buffer_page ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as ma_result
declare function ma_paged_audio_buffer_data_append_page(byval pData as ma_paged_audio_buffer_data ptr, byval pPage as ma_paged_audio_buffer_page ptr) as ma_result
declare function ma_paged_audio_buffer_data_allocate_and_append_page(byval pData as ma_paged_audio_buffer_data ptr, byval pageSizeInFrames as ma_uint32, byval pInitialData as const any ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as ma_result

type ma_paged_audio_buffer_config
	pData as ma_paged_audio_buffer_data ptr
end type

declare function ma_paged_audio_buffer_config_init(byval pData as ma_paged_audio_buffer_data ptr) as ma_paged_audio_buffer_config

type ma_paged_audio_buffer
	ds as ma_data_source_base
	pData as ma_paged_audio_buffer_data ptr
	pCurrent as ma_paged_audio_buffer_page ptr
	relativeCursor as ma_uint64
	absoluteCursor as ma_uint64
end type

declare function ma_paged_audio_buffer_init(byval pConfig as const ma_paged_audio_buffer_config ptr, byval pPagedAudioBuffer as ma_paged_audio_buffer ptr) as ma_result
declare sub ma_paged_audio_buffer_uninit(byval pPagedAudioBuffer as ma_paged_audio_buffer ptr)
declare function ma_paged_audio_buffer_read_pcm_frames(byval pPagedAudioBuffer as ma_paged_audio_buffer ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_paged_audio_buffer_seek_to_pcm_frame(byval pPagedAudioBuffer as ma_paged_audio_buffer ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_paged_audio_buffer_get_cursor_in_pcm_frames(byval pPagedAudioBuffer as ma_paged_audio_buffer ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_paged_audio_buffer_get_length_in_pcm_frames(byval pPagedAudioBuffer as ma_paged_audio_buffer ptr, byval pLength as ma_uint64 ptr) as ma_result
type ma_vfs as any
type ma_vfs_file as ma_handle

type ma_open_mode_flags as long
enum
	MA_OPEN_MODE_READ = &h00000001
	MA_OPEN_MODE_WRITE = &h00000002
end enum

type ma_seek_origin as long
enum
	ma_seek_origin_start
	ma_seek_origin_current
	ma_seek_origin_end
end enum

type ma_file_info
	sizeInBytes as ma_uint64
end type

type ma_vfs_callbacks
	onOpen as function(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval openMode as ma_uint32, byval pFile as ma_vfs_file ptr) as ma_result
	onOpenW as function(byval pVFS as ma_vfs ptr, byval pFilePath as const wstring ptr, byval openMode as ma_uint32, byval pFile as ma_vfs_file ptr) as ma_result
	onClose as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file) as ma_result
	onRead as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pDst as any ptr, byval sizeInBytes as uinteger, byval pBytesRead as uinteger ptr) as ma_result
	onWrite as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pSrc as const any ptr, byval sizeInBytes as uinteger, byval pBytesWritten as uinteger ptr) as ma_result
	onSeek as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval offset as ma_int64, byval origin as ma_seek_origin) as ma_result
	onTell as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pCursor as ma_int64 ptr) as ma_result
	onInfo as function(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pInfo as ma_file_info ptr) as ma_result
end type

declare function ma_vfs_open(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval openMode as ma_uint32, byval pFile as ma_vfs_file ptr) as ma_result
declare function ma_vfs_open_w(byval pVFS as ma_vfs ptr, byval pFilePath as const wstring ptr, byval openMode as ma_uint32, byval pFile as ma_vfs_file ptr) as ma_result
declare function ma_vfs_close(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file) as ma_result
declare function ma_vfs_read(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pDst as any ptr, byval sizeInBytes as uinteger, byval pBytesRead as uinteger ptr) as ma_result
declare function ma_vfs_write(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pSrc as const any ptr, byval sizeInBytes as uinteger, byval pBytesWritten as uinteger ptr) as ma_result
declare function ma_vfs_seek(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval offset as ma_int64, byval origin as ma_seek_origin) as ma_result
declare function ma_vfs_tell(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pCursor as ma_int64 ptr) as ma_result
declare function ma_vfs_info(byval pVFS as ma_vfs ptr, byval file as ma_vfs_file, byval pInfo as ma_file_info ptr) as ma_result
declare function ma_vfs_open_and_read_file(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval ppData as any ptr ptr, byval pSize as uinteger ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as ma_result

type ma_default_vfs
	cb as ma_vfs_callbacks
	allocationCallbacks as ma_allocation_callbacks
end type

declare function ma_default_vfs_init(byval pVFS as ma_default_vfs ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr) as ma_result
type ma_read_proc as function(byval pUserData as any ptr, byval pBufferOut as any ptr, byval bytesToRead as uinteger, byval pBytesRead as uinteger ptr) as ma_result
type ma_seek_proc as function(byval pUserData as any ptr, byval offset as ma_int64, byval origin as ma_seek_origin) as ma_result
type ma_tell_proc as function(byval pUserData as any ptr, byval pCursor as ma_int64 ptr) as ma_result

type ma_encoding_format as long
enum
	ma_encoding_format_unknown = 0
	ma_encoding_format_wav
	ma_encoding_format_flac
	ma_encoding_format_mp3
	ma_encoding_format_vorbis
end enum

type ma_decoding_backend_config
	preferredFormat as ma_format
	seekPointCount as ma_uint32
end type

declare function ma_decoding_backend_config_init(byval preferredFormat as ma_format, byval seekPointCount as ma_uint32) as ma_decoding_backend_config

type ma_decoding_backend_vtable
	onInit as function(byval pUserData as any ptr, byval onRead as ma_read_proc, byval onSeek as ma_seek_proc, byval onTell as ma_tell_proc, byval pReadSeekTellUserData as any ptr, byval pConfig as const ma_decoding_backend_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval ppBackend as ma_data_source ptr ptr) as ma_result
	onInitFile as function(byval pUserData as any ptr, byval pFilePath as const zstring ptr, byval pConfig as const ma_decoding_backend_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval ppBackend as ma_data_source ptr ptr) as ma_result
	onInitFileW as function(byval pUserData as any ptr, byval pFilePath as const wstring ptr, byval pConfig as const ma_decoding_backend_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval ppBackend as ma_data_source ptr ptr) as ma_result
	onInitMemory as function(byval pUserData as any ptr, byval pData as const any ptr, byval dataSize as uinteger, byval pConfig as const ma_decoding_backend_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval ppBackend as ma_data_source ptr ptr) as ma_result
	onUninit as sub(byval pUserData as any ptr, byval pBackend as ma_data_source ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
end type

type ma_decoder as ma_decoder_
type ma_decoder_read_proc as function(byval pDecoder as ma_decoder ptr, byval pBufferOut as any ptr, byval bytesToRead as uinteger, byval pBytesRead as uinteger ptr) as ma_result
type ma_decoder_seek_proc as function(byval pDecoder as ma_decoder ptr, byval byteOffset as ma_int64, byval origin as ma_seek_origin) as ma_result
type ma_decoder_tell_proc as function(byval pDecoder as ma_decoder ptr, byval pCursor as ma_int64 ptr) as ma_result

type ma_decoder_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	pChannelMap as ma_channel ptr
	channelMixMode as ma_channel_mix_mode
	ditherMode as ma_dither_mode
	resampling as ma_resampler_config
	allocationCallbacks as ma_allocation_callbacks
	encodingFormat as ma_encoding_format
	seekPointCount as ma_uint32
	ppCustomBackendVTables as ma_decoding_backend_vtable ptr ptr
	customBackendCount as ma_uint32
	pCustomBackendUserData as any ptr
end type

type ma_decoder_data_vfs
	pVFS as ma_vfs ptr
	file as ma_vfs_file
end type

type ma_decoder_data_memory
	pData as const ma_uint8 ptr
	dataSize as uinteger
	currentReadPos as uinteger
end type

union ma_decoder_data
	vfs as ma_decoder_data_vfs
	memory as ma_decoder_data_memory
end union

type ma_decoder_
	ds as ma_data_source_base
	pBackend as ma_data_source ptr
	pBackendVTable as const ma_decoding_backend_vtable ptr
	pBackendUserData as any ptr
	onRead as ma_decoder_read_proc
	onSeek as ma_decoder_seek_proc
	onTell as ma_decoder_tell_proc
	pUserData as any ptr
	readPointerInPCMFrames as ma_uint64
	outputFormat as ma_format
	outputChannels as ma_uint32
	outputSampleRate as ma_uint32
	converter as ma_data_converter
	pInputCache as any ptr
	inputCacheCap as ma_uint64
	inputCacheConsumed as ma_uint64
	inputCacheRemaining as ma_uint64
	allocationCallbacks as ma_allocation_callbacks
	data as ma_decoder_data
end type

declare function ma_decoder_config_init(byval outputFormat as ma_format, byval outputChannels as ma_uint32, byval outputSampleRate as ma_uint32) as ma_decoder_config
declare function ma_decoder_config_init_default() as ma_decoder_config
declare function ma_decoder_init(byval onRead as ma_decoder_read_proc, byval onSeek as ma_decoder_seek_proc, byval pUserData as any ptr, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_init_memory(byval pData as const any ptr, byval dataSize as uinteger, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_init_vfs(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_init_vfs_w(byval pVFS as ma_vfs ptr, byval pFilePath as const wstring ptr, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_init_file(byval pFilePath as const zstring ptr, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_init_file_w(byval pFilePath as const wstring ptr, byval pConfig as const ma_decoder_config ptr, byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_uninit(byval pDecoder as ma_decoder ptr) as ma_result
declare function ma_decoder_read_pcm_frames(byval pDecoder as ma_decoder ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_decoder_seek_to_pcm_frame(byval pDecoder as ma_decoder ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_decoder_get_data_format(byval pDecoder as ma_decoder ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_decoder_get_cursor_in_pcm_frames(byval pDecoder as ma_decoder ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_decoder_get_length_in_pcm_frames(byval pDecoder as ma_decoder ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_decoder_get_available_frames(byval pDecoder as ma_decoder ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result
declare function ma_decode_from_vfs(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval pConfig as ma_decoder_config ptr, byval pFrameCountOut as ma_uint64 ptr, byval ppPCMFramesOut as any ptr ptr) as ma_result
declare function ma_decode_file(byval pFilePath as const zstring ptr, byval pConfig as ma_decoder_config ptr, byval pFrameCountOut as ma_uint64 ptr, byval ppPCMFramesOut as any ptr ptr) as ma_result
declare function ma_decode_memory(byval pData as const any ptr, byval dataSize as uinteger, byval pConfig as ma_decoder_config ptr, byval pFrameCountOut as ma_uint64 ptr, byval ppPCMFramesOut as any ptr ptr) as ma_result

type ma_encoder as ma_encoder_
type ma_encoder_write_proc as function(byval pEncoder as ma_encoder ptr, byval pBufferIn as const any ptr, byval bytesToWrite as uinteger, byval pBytesWritten as uinteger ptr) as ma_result
type ma_encoder_seek_proc as function(byval pEncoder as ma_encoder ptr, byval offset as ma_int64, byval origin as ma_seek_origin) as ma_result
type ma_encoder_init_proc as function(byval pEncoder as ma_encoder ptr) as ma_result
type ma_encoder_uninit_proc as sub(byval pEncoder as ma_encoder ptr)
type ma_encoder_write_pcm_frames_proc as function(byval pEncoder as ma_encoder ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64, byval pFramesWritten as ma_uint64 ptr) as ma_result

type ma_encoder_config
	encodingFormat as ma_encoding_format
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	allocationCallbacks as ma_allocation_callbacks
end type

declare function ma_encoder_config_init(byval encodingFormat as ma_encoding_format, byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32) as ma_encoder_config

type ma_encoder_data_vfs
	pVFS as ma_vfs ptr
	file as ma_vfs_file
end type

union ma_encoder_data
	vfs as ma_encoder_data_vfs
end union

type ma_encoder_
	config as ma_encoder_config
	onWrite as ma_encoder_write_proc
	onSeek as ma_encoder_seek_proc
	onInit as ma_encoder_init_proc
	onUninit as ma_encoder_uninit_proc
	onWritePCMFrames as ma_encoder_write_pcm_frames_proc
	pUserData as any ptr
	pInternalEncoder as any ptr
	data as ma_encoder_data
end type

declare function ma_encoder_init(byval onWrite as ma_encoder_write_proc, byval onSeek as ma_encoder_seek_proc, byval pUserData as any ptr, byval pConfig as const ma_encoder_config ptr, byval pEncoder as ma_encoder ptr) as ma_result
declare function ma_encoder_init_vfs(byval pVFS as ma_vfs ptr, byval pFilePath as const zstring ptr, byval pConfig as const ma_encoder_config ptr, byval pEncoder as ma_encoder ptr) as ma_result
declare function ma_encoder_init_vfs_w(byval pVFS as ma_vfs ptr, byval pFilePath as const wstring ptr, byval pConfig as const ma_encoder_config ptr, byval pEncoder as ma_encoder ptr) as ma_result
declare function ma_encoder_init_file(byval pFilePath as const zstring ptr, byval pConfig as const ma_encoder_config ptr, byval pEncoder as ma_encoder ptr) as ma_result
declare function ma_encoder_init_file_w(byval pFilePath as const wstring ptr, byval pConfig as const ma_encoder_config ptr, byval pEncoder as ma_encoder ptr) as ma_result
declare sub ma_encoder_uninit(byval pEncoder as ma_encoder ptr)
declare function ma_encoder_write_pcm_frames(byval pEncoder as ma_encoder ptr, byval pFramesIn as const any ptr, byval frameCount as ma_uint64, byval pFramesWritten as ma_uint64 ptr) as ma_result

type ma_waveform_type as long
enum
	ma_waveform_type_sine
	ma_waveform_type_square
	ma_waveform_type_triangle
	ma_waveform_type_sawtooth
end enum

type ma_waveform_config
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
	as ma_waveform_type type
	amplitude as double
	frequency as double
end type

declare function ma_waveform_config_init(byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32, byval type as ma_waveform_type, byval amplitude as double, byval frequency as double) as ma_waveform_config

type ma_waveform
	ds as ma_data_source_base
	config as ma_waveform_config
	advance as double
	time as double
end type

declare function ma_waveform_init(byval pConfig as const ma_waveform_config ptr, byval pWaveform as ma_waveform ptr) as ma_result
declare sub ma_waveform_uninit(byval pWaveform as ma_waveform ptr)
declare function ma_waveform_read_pcm_frames(byval pWaveform as ma_waveform ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_waveform_seek_to_pcm_frame(byval pWaveform as ma_waveform ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_waveform_set_amplitude(byval pWaveform as ma_waveform ptr, byval amplitude as double) as ma_result
declare function ma_waveform_set_frequency(byval pWaveform as ma_waveform ptr, byval frequency as double) as ma_result
declare function ma_waveform_set_type(byval pWaveform as ma_waveform ptr, byval type as ma_waveform_type) as ma_result
declare function ma_waveform_set_sample_rate(byval pWaveform as ma_waveform ptr, byval sampleRate as ma_uint32) as ma_result

type ma_noise_type as long
enum
	ma_noise_type_white
	ma_noise_type_pink
	ma_noise_type_brownian
end enum

type ma_noise_config
	format as ma_format
	channels as ma_uint32
	as ma_noise_type type
	seed as ma_int32
	amplitude as double
	duplicateChannels as ma_bool32
end type

declare function ma_noise_config_init(byval format as ma_format, byval channels as ma_uint32, byval type as ma_noise_type, byval seed as ma_int32, byval amplitude as double) as ma_noise_config

type ma_noise_state_pink
	bin as double ptr ptr
	accumulation as double ptr
	counter as ma_uint32 ptr
end type

type ma_noise_state_brownian
	accumulation as double ptr
end type

union ma_noise_state
	pink as ma_noise_state_pink
	brownian as ma_noise_state_brownian
end union

type ma_noise
	ds as ma_data_source_vtable
	config as ma_noise_config
	lcg as ma_lcg
	state as ma_noise_state
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_noise_get_heap_size(byval pConfig as const ma_noise_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_noise_init_preallocated(byval pConfig as const ma_noise_config ptr, byval pHeap as any ptr, byval pNoise as ma_noise ptr) as ma_result
declare function ma_noise_init(byval pConfig as const ma_noise_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNoise as ma_noise ptr) as ma_result
declare sub ma_noise_uninit(byval pNoise as ma_noise ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_noise_read_pcm_frames(byval pNoise as ma_noise ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_noise_set_amplitude(byval pNoise as ma_noise ptr, byval amplitude as double) as ma_result
declare function ma_noise_set_seed(byval pNoise as ma_noise ptr, byval seed as ma_int32) as ma_result
declare function ma_noise_set_type(byval pNoise as ma_noise ptr, byval type as ma_noise_type) as ma_result

type ma_resource_manager_data_source_flags as long
enum
	MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_STREAM = &h00000001
	MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_DECODE = &h00000002
	MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_ASYNC = &h00000004
	MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_WAIT_INIT = &h00000008
end enum

type ma_resource_manager_pipeline_stage_notification
	pNotification as ma_async_notification ptr
	pFence as ma_fence ptr
end type

type ma_resource_manager_pipeline_notifications
	init as ma_resource_manager_pipeline_stage_notification
	done as ma_resource_manager_pipeline_stage_notification
end type

declare function ma_resource_manager_pipeline_notifications_init() as ma_resource_manager_pipeline_notifications
type ma_resource_manager_job as ma_job
declare function ma_resource_manager_job_init alias "ma_job_init"(byval code as ma_uint16) as ma_job
const MA_JOB_TYPE_RESOURCE_MANAGER_QUEUE_FLAG_NON_BLOCKING = MA_JOB_QUEUE_FLAG_NON_BLOCKING
type ma_resource_manager_job_queue_config as ma_job_queue_config
declare function ma_resource_manager_job_queue_config_init alias "ma_job_queue_config_init"(byval flags as ma_uint32, byval capacity as ma_uint32) as ma_job_queue_config
type ma_resource_manager_job_queue as ma_job_queue
declare function ma_resource_manager_job_queue_get_heap_size alias "ma_job_queue_get_heap_size"(byval pConfig as const ma_job_queue_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_resource_manager_job_queue_init_preallocated alias "ma_job_queue_init_preallocated"(byval pConfig as const ma_job_queue_config ptr, byval pHeap as any ptr, byval pQueue as ma_job_queue ptr) as ma_result
declare function ma_resource_manager_job_queue_init alias "ma_job_queue_init"(byval pConfig as const ma_job_queue_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pQueue as ma_job_queue ptr) as ma_result
declare sub ma_resource_manager_job_queue_uninit alias "ma_job_queue_uninit"(byval pQueue as ma_job_queue ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_resource_manager_job_queue_post alias "ma_job_queue_post"(byval pQueue as ma_job_queue ptr, byval pJob as const ma_job ptr) as ma_result
declare function ma_resource_manager_job_queue_next alias "ma_job_queue_next"(byval pQueue as ma_job_queue ptr, byval pJob as ma_job ptr) as ma_result
const MA_RESOURCE_MANAGER_MAX_JOB_THREAD_COUNT = 64

type ma_resource_manager_flags as long
enum
	MA_RESOURCE_MANAGER_FLAG_NON_BLOCKING = &h00000001
	MA_RESOURCE_MANAGER_FLAG_NO_THREADING = &h00000002
end enum

type ma_resource_manager_data_source_config
	pFilePath as const zstring ptr
	pFilePathW as const wstring ptr
	pNotifications as const ma_resource_manager_pipeline_notifications ptr
	initialSeekPointInPCMFrames as ma_uint64
	rangeBegInPCMFrames as ma_uint64
	rangeEndInPCMFrames as ma_uint64
	loopPointBegInPCMFrames as ma_uint64
	loopPointEndInPCMFrames as ma_uint64
	isLooping as ma_bool32
	flags as ma_uint32
end type

declare function ma_resource_manager_data_source_config_init() as ma_resource_manager_data_source_config

type ma_resource_manager_data_supply_type as long
enum
	ma_resource_manager_data_supply_type_unknown = 0
	ma_resource_manager_data_supply_type_encoded
	ma_resource_manager_data_supply_type_decoded
	ma_resource_manager_data_supply_type_decoded_paged
end enum

type ma_resource_manager_data_supply_backend_encoded
	pData as const any ptr
	sizeInBytes as uinteger
end type

type ma_resource_manager_data_supply_backend_decoded
	pData as const any ptr
	totalFrameCount as ma_uint64
	decodedFrameCount as ma_uint64
	format as ma_format
	channels as ma_uint32
	sampleRate as ma_uint32
end type

type ma_resource_manager_data_supply_backend_decodedPaged
	data as ma_paged_audio_buffer_data
	decodedFrameCount as ma_uint64
	sampleRate as ma_uint32
end type

union ma_resource_manager_data_supply_backend
	encoded as ma_resource_manager_data_supply_backend_encoded
	decoded as ma_resource_manager_data_supply_backend_decoded
	decodedPaged as ma_resource_manager_data_supply_backend_decodedPaged
end union

type ma_resource_manager_data_supply
	as ma_resource_manager_data_supply_type type
	backend as ma_resource_manager_data_supply_backend
end type

type ma_resource_manager_data_buffer_node
	hashedName32 as ma_uint32
	refCount as ma_uint32
	result as ma_result
	executionCounter as ma_uint32
	executionPointer as ma_uint32
	isDataOwnedByResourceManager as ma_bool32
	data as ma_resource_manager_data_supply
	pParent as ma_resource_manager_data_buffer_node ptr
	pChildLo as ma_resource_manager_data_buffer_node ptr
	pChildHi as ma_resource_manager_data_buffer_node ptr
end type

union ma_resource_manager_data_buffer_connector
	decoder as ma_decoder
	buffer as ma_audio_buffer
	pagedBuffer as ma_paged_audio_buffer
end union

type ma_resource_manager as ma_resource_manager_

type ma_resource_manager_data_buffer
	ds as ma_data_source_base
	pResourceManager as ma_resource_manager ptr
	pNode as ma_resource_manager_data_buffer_node ptr
	flags as ma_uint32
	executionCounter as ma_uint32
	executionPointer as ma_uint32
	seekTargetInPCMFrames as ma_uint64
	seekToCursorOnNextRead as ma_bool32
	result as ma_result
	isLooping as ma_bool32
	isConnectorInitialized as ma_bool32
	connector as ma_resource_manager_data_buffer_connector
end type

type ma_resource_manager_data_stream
	ds as ma_data_source_base
	pResourceManager as ma_resource_manager ptr
	flags as ma_uint32
	decoder as ma_decoder
	isDecoderInitialized as ma_bool32
	totalLengthInPCMFrames as ma_uint64
	relativeCursor as ma_uint32
	absoluteCursor as ma_uint64
	currentPageIndex as ma_uint32
	executionCounter as ma_uint32
	executionPointer as ma_uint32
	isLooping as ma_bool32
	pPageData as any ptr
	pageFrameCount(0 to 1) as ma_uint32
	result as ma_result
	isDecoderAtEnd as ma_bool32
	isPageValid(0 to 1) as ma_bool32
	seekCounter as ma_bool32
end type

union ma_resource_manager_data_source_backend
	buffer as ma_resource_manager_data_buffer
	stream as ma_resource_manager_data_stream
end union

type ma_resource_manager_data_source
	backend as ma_resource_manager_data_source_backend
	flags as ma_uint32
	executionCounter as ma_uint32
	executionPointer as ma_uint32
end type

type ma_resource_manager_config
	allocationCallbacks as ma_allocation_callbacks
	pLog as ma_log ptr
	decodedFormat as ma_format
	decodedChannels as ma_uint32
	decodedSampleRate as ma_uint32
	jobThreadCount as ma_uint32
	jobQueueCapacity as ma_uint32
	flags as ma_uint32
	pVFS as ma_vfs ptr
	ppCustomDecodingBackendVTables as ma_decoding_backend_vtable ptr ptr
	customDecodingBackendCount as ma_uint32
	pCustomDecodingBackendUserData as any ptr
end type

declare function ma_resource_manager_config_init() as ma_resource_manager_config

type ma_resource_manager_
	config as ma_resource_manager_config
	pRootDataBufferNode as ma_resource_manager_data_buffer_node ptr
	dataBufferBSTLock as ma_mutex
	jobThreads(0 to 63) as ma_thread
	jobQueue as ma_job_queue
	defaultVFS as ma_default_vfs
	log as ma_log
end type

declare function ma_resource_manager_init(byval pConfig as const ma_resource_manager_config ptr, byval pResourceManager as ma_resource_manager ptr) as ma_result
declare sub ma_resource_manager_uninit(byval pResourceManager as ma_resource_manager ptr)
declare function ma_resource_manager_get_log(byval pResourceManager as ma_resource_manager ptr) as ma_log ptr
declare function ma_resource_manager_register_file(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const zstring ptr, byval flags as ma_uint32) as ma_result
declare function ma_resource_manager_register_file_w(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const wstring ptr, byval flags as ma_uint32) as ma_result
declare function ma_resource_manager_register_decoded_data(byval pResourceManager as ma_resource_manager ptr, byval pName as const zstring ptr, byval pData as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32) as ma_result
declare function ma_resource_manager_register_decoded_data_w(byval pResourceManager as ma_resource_manager ptr, byval pName as const wstring ptr, byval pData as const any ptr, byval frameCount as ma_uint64, byval format as ma_format, byval channels as ma_uint32, byval sampleRate as ma_uint32) as ma_result
declare function ma_resource_manager_register_encoded_data(byval pResourceManager as ma_resource_manager ptr, byval pName as const zstring ptr, byval pData as const any ptr, byval sizeInBytes as uinteger) as ma_result
declare function ma_resource_manager_register_encoded_data_w(byval pResourceManager as ma_resource_manager ptr, byval pName as const wstring ptr, byval pData as const any ptr, byval sizeInBytes as uinteger) as ma_result
declare function ma_resource_manager_unregister_file(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const zstring ptr) as ma_result
declare function ma_resource_manager_unregister_file_w(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const wstring ptr) as ma_result
declare function ma_resource_manager_unregister_data(byval pResourceManager as ma_resource_manager ptr, byval pName as const zstring ptr) as ma_result
declare function ma_resource_manager_unregister_data_w(byval pResourceManager as ma_resource_manager ptr, byval pName as const wstring ptr) as ma_result
declare function ma_resource_manager_data_buffer_init_ex(byval pResourceManager as ma_resource_manager ptr, byval pConfig as const ma_resource_manager_data_source_config ptr, byval pDataBuffer as ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_init(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const zstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataBuffer as ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_init_w(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const wstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataBuffer as ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_init_copy(byval pResourceManager as ma_resource_manager ptr, byval pExistingDataBuffer as const ma_resource_manager_data_buffer ptr, byval pDataBuffer as ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_uninit(byval pDataBuffer as ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_read_pcm_frames(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_buffer_seek_to_pcm_frame(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_resource_manager_data_buffer_get_data_format(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_resource_manager_data_buffer_get_cursor_in_pcm_frames(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_buffer_get_length_in_pcm_frames(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_buffer_result(byval pDataBuffer as const ma_resource_manager_data_buffer ptr) as ma_result
declare function ma_resource_manager_data_buffer_set_looping(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval isLooping as ma_bool32) as ma_result
declare function ma_resource_manager_data_buffer_is_looping(byval pDataBuffer as const ma_resource_manager_data_buffer ptr) as ma_bool32
declare function ma_resource_manager_data_buffer_get_available_frames(byval pDataBuffer as ma_resource_manager_data_buffer ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_stream_init_ex(byval pResourceManager as ma_resource_manager ptr, byval pConfig as const ma_resource_manager_data_source_config ptr, byval pDataStream as ma_resource_manager_data_stream ptr) as ma_result
declare function ma_resource_manager_data_stream_init(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const zstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataStream as ma_resource_manager_data_stream ptr) as ma_result
declare function ma_resource_manager_data_stream_init_w(byval pResourceManager as ma_resource_manager ptr, byval pFilePath as const wstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataStream as ma_resource_manager_data_stream ptr) as ma_result
declare function ma_resource_manager_data_stream_uninit(byval pDataStream as ma_resource_manager_data_stream ptr) as ma_result
declare function ma_resource_manager_data_stream_read_pcm_frames(byval pDataStream as ma_resource_manager_data_stream ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_stream_seek_to_pcm_frame(byval pDataStream as ma_resource_manager_data_stream ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_resource_manager_data_stream_get_data_format(byval pDataStream as ma_resource_manager_data_stream ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_resource_manager_data_stream_get_cursor_in_pcm_frames(byval pDataStream as ma_resource_manager_data_stream ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_stream_get_length_in_pcm_frames(byval pDataStream as ma_resource_manager_data_stream ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_stream_result(byval pDataStream as const ma_resource_manager_data_stream ptr) as ma_result
declare function ma_resource_manager_data_stream_set_looping(byval pDataStream as ma_resource_manager_data_stream ptr, byval isLooping as ma_bool32) as ma_result
declare function ma_resource_manager_data_stream_is_looping(byval pDataStream as const ma_resource_manager_data_stream ptr) as ma_bool32
declare function ma_resource_manager_data_stream_get_available_frames(byval pDataStream as ma_resource_manager_data_stream ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_source_init_ex(byval pResourceManager as ma_resource_manager ptr, byval pConfig as const ma_resource_manager_data_source_config ptr, byval pDataSource as ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_init(byval pResourceManager as ma_resource_manager ptr, byval pName as const zstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataSource as ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_init_w(byval pResourceManager as ma_resource_manager ptr, byval pName as const wstring ptr, byval flags as ma_uint32, byval pNotifications as const ma_resource_manager_pipeline_notifications ptr, byval pDataSource as ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_init_copy(byval pResourceManager as ma_resource_manager ptr, byval pExistingDataSource as const ma_resource_manager_data_source ptr, byval pDataSource as ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_uninit(byval pDataSource as ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_read_pcm_frames(byval pDataSource as ma_resource_manager_data_source ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_source_seek_to_pcm_frame(byval pDataSource as ma_resource_manager_data_source ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_resource_manager_data_source_get_data_format(byval pDataSource as ma_resource_manager_data_source ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_resource_manager_data_source_get_cursor_in_pcm_frames(byval pDataSource as ma_resource_manager_data_source ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_source_get_length_in_pcm_frames(byval pDataSource as ma_resource_manager_data_source ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_data_source_result(byval pDataSource as const ma_resource_manager_data_source ptr) as ma_result
declare function ma_resource_manager_data_source_set_looping(byval pDataSource as ma_resource_manager_data_source ptr, byval isLooping as ma_bool32) as ma_result
declare function ma_resource_manager_data_source_is_looping(byval pDataSource as const ma_resource_manager_data_source ptr) as ma_bool32
declare function ma_resource_manager_data_source_get_available_frames(byval pDataSource as ma_resource_manager_data_source ptr, byval pAvailableFrames as ma_uint64 ptr) as ma_result
declare function ma_resource_manager_post_job(byval pResourceManager as ma_resource_manager ptr, byval pJob as const ma_job ptr) as ma_result
declare function ma_resource_manager_post_job_quit(byval pResourceManager as ma_resource_manager ptr) as ma_result
declare function ma_resource_manager_next_job(byval pResourceManager as ma_resource_manager ptr, byval pJob as ma_job ptr) as ma_result
declare function ma_resource_manager_process_job(byval pResourceManager as ma_resource_manager ptr, byval pJob as ma_job ptr) as ma_result
declare function ma_resource_manager_process_next_job(byval pResourceManager as ma_resource_manager ptr) as ma_result

const MA_MAX_NODE_BUS_COUNT = 254
const MA_MAX_NODE_LOCAL_BUS_COUNT = 2
const MA_NODE_BUS_COUNT_UNKNOWN = 255
type ma_node as any

type ma_node_flags as long
enum
	MA_NODE_FLAG_PASSTHROUGH = &h00000001
	MA_NODE_FLAG_CONTINUOUS_PROCESSING = &h00000002
	MA_NODE_FLAG_ALLOW_NULL_INPUT = &h00000004
	MA_NODE_FLAG_DIFFERENT_PROCESSING_RATES = &h00000008
	MA_NODE_FLAG_SILENT_OUTPUT = &h00000010
end enum

type ma_node_state as long
enum
	ma_node_state_started = 0
	ma_node_state_stopped = 1
end enum

type ma_node_vtable
	onProcess as sub(byval pNode as ma_node ptr, byval ppFramesIn as const single ptr ptr, byval pFrameCountIn as ma_uint32 ptr, byval ppFramesOut as single ptr ptr, byval pFrameCountOut as ma_uint32 ptr)
	onGetRequiredInputFrameCount as function(byval pNode as ma_node ptr, byval outputFrameCount as ma_uint32, byval pInputFrameCount as ma_uint32 ptr) as ma_result
	inputBusCount as ma_uint8
	outputBusCount as ma_uint8
	flags as ma_uint32
end type

type ma_node_config
	vtable as const ma_node_vtable ptr
	initialState as ma_node_state
	inputBusCount as ma_uint32
	outputBusCount as ma_uint32
	pInputChannels as const ma_uint32 ptr
	pOutputChannels as const ma_uint32 ptr
end type

declare function ma_node_config_init() as ma_node_config

type ma_node_output_bus
	pNode as ma_node ptr
	outputBusIndex as ma_uint8
	channels as ma_uint8
	inputNodeInputBusIndex as ma_uint8
	flags as ma_uint32
	refCount as ma_uint32
	isAttached as ma_bool32
	lock as ma_spinlock
	volume as single
	pNext as ma_node_output_bus ptr
	pPrev as ma_node_output_bus ptr
	pInputNode as ma_node ptr
end type

type ma_node_input_bus
	head as ma_node_output_bus
	nextCounter as ma_uint32
	lock as ma_spinlock
	channels as ma_uint8
end type

type ma_node_graph as ma_node_graph_

type ma_node_base
	pNodeGraph as ma_node_graph ptr
	vtable as const ma_node_vtable ptr
	pCachedData as single ptr
	cachedDataCapInFramesPerBus as ma_uint16
	cachedFrameCountOut as ma_uint16
	cachedFrameCountIn as ma_uint16
	consumedFrameCountIn as ma_uint16
	state as ma_node_state
	stateTimes(0 to 1) as ma_uint64
	localTime as ma_uint64
	inputBusCount as ma_uint32
	outputBusCount as ma_uint32
	pInputBuses as ma_node_input_bus ptr
	pOutputBuses as ma_node_output_bus ptr
	_inputBuses(0 to 1) as ma_node_input_bus
	_outputBuses(0 to 1) as ma_node_output_bus
	_pHeap as any ptr
	_ownsHeap as ma_bool32
end type

declare function ma_node_get_heap_size(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_node_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_node_init_preallocated(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_node_config ptr, byval pHeap as any ptr, byval pNode as ma_node ptr) as ma_result
declare function ma_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_node ptr) as ma_result
declare sub ma_node_uninit(byval pNode as ma_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_node_get_node_graph(byval pNode as const ma_node ptr) as ma_node_graph ptr
declare function ma_node_get_input_bus_count(byval pNode as const ma_node ptr) as ma_uint32
declare function ma_node_get_output_bus_count(byval pNode as const ma_node ptr) as ma_uint32
declare function ma_node_get_input_channels(byval pNode as const ma_node ptr, byval inputBusIndex as ma_uint32) as ma_uint32
declare function ma_node_get_output_channels(byval pNode as const ma_node ptr, byval outputBusIndex as ma_uint32) as ma_uint32
declare function ma_node_attach_output_bus(byval pNode as ma_node ptr, byval outputBusIndex as ma_uint32, byval pOtherNode as ma_node ptr, byval otherNodeInputBusIndex as ma_uint32) as ma_result
declare function ma_node_detach_output_bus(byval pNode as ma_node ptr, byval outputBusIndex as ma_uint32) as ma_result
declare function ma_node_detach_all_output_buses(byval pNode as ma_node ptr) as ma_result
declare function ma_node_set_output_bus_volume(byval pNode as ma_node ptr, byval outputBusIndex as ma_uint32, byval volume as single) as ma_result
declare function ma_node_get_output_bus_volume(byval pNode as const ma_node ptr, byval outputBusIndex as ma_uint32) as single
declare function ma_node_set_state(byval pNode as ma_node ptr, byval state as ma_node_state) as ma_result
declare function ma_node_get_state(byval pNode as const ma_node ptr) as ma_node_state
declare function ma_node_set_state_time(byval pNode as ma_node ptr, byval state as ma_node_state, byval globalTime as ma_uint64) as ma_result
declare function ma_node_get_state_time(byval pNode as const ma_node ptr, byval state as ma_node_state) as ma_uint64
declare function ma_node_get_state_by_time(byval pNode as const ma_node ptr, byval globalTime as ma_uint64) as ma_node_state
declare function ma_node_get_state_by_time_range(byval pNode as const ma_node ptr, byval globalTimeBeg as ma_uint64, byval globalTimeEnd as ma_uint64) as ma_node_state
declare function ma_node_get_time(byval pNode as const ma_node ptr) as ma_uint64
declare function ma_node_set_time(byval pNode as ma_node ptr, byval localTime as ma_uint64) as ma_result

type ma_node_graph_config
	channels as ma_uint32
	nodeCacheCapInFrames as ma_uint16
end type

declare function ma_node_graph_config_init(byval channels as ma_uint32) as ma_node_graph_config

type ma_node_graph_
	base as ma_node_base
	endpoint as ma_node_base
	nodeCacheCapInFrames as ma_uint16
	isReading as ma_bool32
end type

declare function ma_node_graph_init(byval pConfig as const ma_node_graph_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNodeGraph as ma_node_graph ptr) as ma_result
declare sub ma_node_graph_uninit(byval pNodeGraph as ma_node_graph ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_node_graph_get_endpoint(byval pNodeGraph as ma_node_graph ptr) as ma_node ptr
declare function ma_node_graph_read_pcm_frames(byval pNodeGraph as ma_node_graph ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_node_graph_get_channels(byval pNodeGraph as const ma_node_graph ptr) as ma_uint32
declare function ma_node_graph_get_time(byval pNodeGraph as const ma_node_graph ptr) as ma_uint64
declare function ma_node_graph_set_time(byval pNodeGraph as ma_node_graph ptr, byval globalTime as ma_uint64) as ma_result

type ma_data_source_node_config
	nodeConfig as ma_node_config
	pDataSource as ma_data_source ptr
end type

declare function ma_data_source_node_config_init(byval pDataSource as ma_data_source ptr) as ma_data_source_node_config

type ma_data_source_node
	base as ma_node_base
	pDataSource as ma_data_source ptr
end type

declare function ma_data_source_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_data_source_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pDataSourceNode as ma_data_source_node ptr) as ma_result
declare sub ma_data_source_node_uninit(byval pDataSourceNode as ma_data_source_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare function ma_data_source_node_set_looping(byval pDataSourceNode as ma_data_source_node ptr, byval isLooping as ma_bool32) as ma_result
declare function ma_data_source_node_is_looping(byval pDataSourceNode as ma_data_source_node ptr) as ma_bool32

type ma_splitter_node_config
	nodeConfig as ma_node_config
	channels as ma_uint32
end type

declare function ma_splitter_node_config_init(byval channels as ma_uint32) as ma_splitter_node_config

type ma_splitter_node
	base as ma_node_base
end type

declare function ma_splitter_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_splitter_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pSplitterNode as ma_splitter_node ptr) as ma_result
declare sub ma_splitter_node_uninit(byval pSplitterNode as ma_splitter_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_biquad_node_config
	nodeConfig as ma_node_config
	biquad as ma_biquad_config
end type

declare function ma_biquad_node_config_init(byval channels as ma_uint32, byval b0 as single, byval b1 as single, byval b2 as single, byval a0 as single, byval a1 as single, byval a2 as single) as ma_biquad_node_config

type ma_biquad_node
	baseNode as ma_node_base
	biquad as ma_biquad
end type

declare function ma_biquad_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_biquad_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_biquad_node ptr) as ma_result
declare function ma_biquad_node_reinit(byval pConfig as const ma_biquad_config ptr, byval pNode as ma_biquad_node ptr) as ma_result
declare sub ma_biquad_node_uninit(byval pNode as ma_biquad_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_lpf_node_config
	nodeConfig as ma_node_config
	lpf as ma_lpf_config
end type

declare function ma_lpf_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_lpf_node_config

type ma_lpf_node
	baseNode as ma_node_base
	lpf as ma_lpf
end type

declare function ma_lpf_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_lpf_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_lpf_node ptr) as ma_result
declare function ma_lpf_node_reinit(byval pConfig as const ma_lpf_config ptr, byval pNode as ma_lpf_node ptr) as ma_result
declare sub ma_lpf_node_uninit(byval pNode as ma_lpf_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_hpf_node_config
	nodeConfig as ma_node_config
	hpf as ma_hpf_config
end type

declare function ma_hpf_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_hpf_node_config

type ma_hpf_node
	baseNode as ma_node_base
	hpf as ma_hpf
end type

declare function ma_hpf_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_hpf_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_hpf_node ptr) as ma_result
declare function ma_hpf_node_reinit(byval pConfig as const ma_hpf_config ptr, byval pNode as ma_hpf_node ptr) as ma_result
declare sub ma_hpf_node_uninit(byval pNode as ma_hpf_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_bpf_node_config
	nodeConfig as ma_node_config
	bpf as ma_bpf_config
end type

declare function ma_bpf_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval cutoffFrequency as double, byval order as ma_uint32) as ma_bpf_node_config

type ma_bpf_node
	baseNode as ma_node_base
	bpf as ma_bpf
end type

declare function ma_bpf_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_bpf_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_bpf_node ptr) as ma_result
declare function ma_bpf_node_reinit(byval pConfig as const ma_bpf_config ptr, byval pNode as ma_bpf_node ptr) as ma_result
declare sub ma_bpf_node_uninit(byval pNode as ma_bpf_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_notch_node_config
	nodeConfig as ma_node_config
	notch as ma_notch_config
end type

declare function ma_notch_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval q as double, byval frequency as double) as ma_notch_node_config

type ma_notch_node
	baseNode as ma_node_base
	notch as ma_notch2
end type

declare function ma_notch_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_notch_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_notch_node ptr) as ma_result
declare function ma_notch_node_reinit(byval pConfig as const ma_notch_config ptr, byval pNode as ma_notch_node ptr) as ma_result
declare sub ma_notch_node_uninit(byval pNode as ma_notch_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_peak_node_config
	nodeConfig as ma_node_config
	peak as ma_peak_config
end type

declare function ma_peak_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval q as double, byval frequency as double) as ma_peak_node_config

type ma_peak_node
	baseNode as ma_node_base
	peak as ma_peak2
end type

declare function ma_peak_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_peak_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_peak_node ptr) as ma_result
declare function ma_peak_node_reinit(byval pConfig as const ma_peak_config ptr, byval pNode as ma_peak_node ptr) as ma_result
declare sub ma_peak_node_uninit(byval pNode as ma_peak_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_loshelf_node_config
	nodeConfig as ma_node_config
	loshelf as ma_loshelf_config
end type

declare function ma_loshelf_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval q as double, byval frequency as double) as ma_loshelf_node_config

type ma_loshelf_node
	baseNode as ma_node_base
	loshelf as ma_loshelf2
end type

declare function ma_loshelf_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_loshelf_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_loshelf_node ptr) as ma_result
declare function ma_loshelf_node_reinit(byval pConfig as const ma_loshelf_config ptr, byval pNode as ma_loshelf_node ptr) as ma_result
declare sub ma_loshelf_node_uninit(byval pNode as ma_loshelf_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_hishelf_node_config
	nodeConfig as ma_node_config
	hishelf as ma_hishelf_config
end type

declare function ma_hishelf_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval gainDB as double, byval q as double, byval frequency as double) as ma_hishelf_node_config

type ma_hishelf_node
	baseNode as ma_node_base
	hishelf as ma_hishelf2
end type

declare function ma_hishelf_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_hishelf_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pNode as ma_hishelf_node ptr) as ma_result
declare function ma_hishelf_node_reinit(byval pConfig as const ma_hishelf_config ptr, byval pNode as ma_hishelf_node ptr) as ma_result
declare sub ma_hishelf_node_uninit(byval pNode as ma_hishelf_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)

type ma_delay_node_config
	nodeConfig as ma_node_config
	delay as ma_delay_config
end type

declare function ma_delay_node_config_init(byval channels as ma_uint32, byval sampleRate as ma_uint32, byval delayInFrames as ma_uint32, byval decay as single) as ma_delay_node_config

type ma_delay_node
	baseNode as ma_node_base
	delay as ma_delay
end type

declare function ma_delay_node_init(byval pNodeGraph as ma_node_graph ptr, byval pConfig as const ma_delay_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pDelayNode as ma_delay_node ptr) as ma_result
declare sub ma_delay_node_uninit(byval pDelayNode as ma_delay_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
declare sub ma_delay_node_set_wet(byval pDelayNode as ma_delay_node ptr, byval value as single)
declare function ma_delay_node_get_wet(byval pDelayNode as const ma_delay_node ptr) as single
declare sub ma_delay_node_set_dry(byval pDelayNode as ma_delay_node ptr, byval value as single)
declare function ma_delay_node_get_dry(byval pDelayNode as const ma_delay_node ptr) as single
declare sub ma_delay_node_set_decay(byval pDelayNode as ma_delay_node ptr, byval value as single)
declare function ma_delay_node_get_decay(byval pDelayNode as const ma_delay_node ptr) as single

type ma_sound_flags as long
enum
	MA_SOUND_FLAG_STREAM = &h00000001
	MA_SOUND_FLAG_DECODE = &h00000002
	MA_SOUND_FLAG_ASYNC = &h00000004
	MA_SOUND_FLAG_WAIT_INIT = &h00000008
	MA_SOUND_FLAG_NO_DEFAULT_ATTACHMENT = &h00000010
	MA_SOUND_FLAG_NO_PITCH = &h00000020
	MA_SOUND_FLAG_NO_SPATIALIZATION = &h00000040
end enum

const MA_ENGINE_MAX_LISTENERS = 4
const MA_LISTENER_INDEX_CLOSEST = cast(ma_uint8, -1)

type ma_engine_node_type as long
enum
	ma_engine_node_type_sound
	ma_engine_node_type_group
end enum

type ma_engine as ma_engine_

type ma_engine_node_config
	pEngine as ma_engine ptr
	as ma_engine_node_type type
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	sampleRate as ma_uint32
	isPitchDisabled as ma_bool8
	isSpatializationDisabled as ma_bool8
	pinnedListenerIndex as ma_uint8
end type

declare function ma_engine_node_config_init(byval pEngine as ma_engine ptr, byval type as ma_engine_node_type, byval flags as ma_uint32) as ma_engine_node_config

type ma_engine_node
	baseNode as ma_node_base
	pEngine as ma_engine ptr
	sampleRate as ma_uint32
	fader as ma_fader
	resampler as ma_linear_resampler
	spatializer as ma_spatializer
	panner as ma_panner
	pitch as single
	oldPitch as single
	oldDopplerPitch as single
	isPitchDisabled as ma_bool32
	isSpatializationDisabled as ma_bool32
	pinnedListenerIndex as ma_uint32
	_ownsHeap as ma_bool8
	_pHeap as any ptr
end type

declare function ma_engine_node_get_heap_size(byval pConfig as const ma_engine_node_config ptr, byval pHeapSizeInBytes as uinteger ptr) as ma_result
declare function ma_engine_node_init_preallocated(byval pConfig as const ma_engine_node_config ptr, byval pHeap as any ptr, byval pEngineNode as ma_engine_node ptr) as ma_result
declare function ma_engine_node_init(byval pConfig as const ma_engine_node_config ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr, byval pEngineNode as ma_engine_node ptr) as ma_result
declare sub ma_engine_node_uninit(byval pEngineNode as ma_engine_node ptr, byval pAllocationCallbacks as const ma_allocation_callbacks ptr)
const MA_SOUND_SOURCE_CHANNEL_COUNT = &hFFFFFFFF

type ma_sound_config
	pFilePath as const zstring ptr
	pFilePathW as const wstring ptr
	pDataSource as ma_data_source ptr
	pInitialAttachment as ma_node ptr
	initialAttachmentInputBusIndex as ma_uint32
	channelsIn as ma_uint32
	channelsOut as ma_uint32
	flags as ma_uint32
	initialSeekPointInPCMFrames as ma_uint64
	rangeBegInPCMFrames as ma_uint64
	rangeEndInPCMFrames as ma_uint64
	loopPointBegInPCMFrames as ma_uint64
	loopPointEndInPCMFrames as ma_uint64
	isLooping as ma_bool32
	pDoneFence as ma_fence ptr
end type

declare function ma_sound_config_init() as ma_sound_config

type ma_sound
	engineNode as ma_engine_node
	pDataSource as ma_data_source ptr
	seekTarget as ma_uint64
	atEnd as ma_bool32
	ownsDataSource as ma_bool8
	pResourceManagerDataSource as ma_resource_manager_data_source ptr
end type

type ma_sound_inlined
	sound as ma_sound
	pNext as ma_sound_inlined ptr
	pPrev as ma_sound_inlined ptr
end type

type ma_sound_group_config as ma_sound_config
type ma_sound_group as ma_sound
declare function ma_sound_group_config_init() as ma_sound_group_config

type ma_engine_config
	pResourceManager as ma_resource_manager ptr
	pContext as ma_context ptr
	pDevice as ma_device ptr
	pPlaybackDeviceID as ma_device_id ptr
	pLog as ma_log ptr
	listenerCount as ma_uint32
	channels as ma_uint32
	sampleRate as ma_uint32
	periodSizeInFrames as ma_uint32
	periodSizeInMilliseconds as ma_uint32
	gainSmoothTimeInFrames as ma_uint32
	gainSmoothTimeInMilliseconds as ma_uint32
	allocationCallbacks as ma_allocation_callbacks
	noAutoStart as ma_bool32
	noDevice as ma_bool32
	monoExpansionMode as ma_mono_expansion_mode
	pResourceManagerVFS as ma_vfs ptr
end type

declare function ma_engine_config_init() as ma_engine_config

type ma_engine_
	nodeGraph as ma_node_graph
	pResourceManager as ma_resource_manager ptr
	pDevice as ma_device ptr
	pLog as ma_log ptr
	sampleRate as ma_uint32
	listenerCount as ma_uint32
	listeners(0 to 3) as ma_spatializer_listener
	allocationCallbacks as ma_allocation_callbacks
	ownsResourceManager as ma_bool8
	ownsDevice as ma_bool8
	inlinedSoundLock as ma_spinlock
	pInlinedSoundHead as ma_sound_inlined ptr
	inlinedSoundCount as ma_uint32
	gainSmoothTimeInFrames as ma_uint32
	monoExpansionMode as ma_mono_expansion_mode
end type

declare function ma_engine_init(byval pConfig as const ma_engine_config ptr, byval pEngine as ma_engine ptr) as ma_result
declare sub ma_engine_uninit(byval pEngine as ma_engine ptr)
declare function ma_engine_read_pcm_frames(byval pEngine as ma_engine ptr, byval pFramesOut as any ptr, byval frameCount as ma_uint64, byval pFramesRead as ma_uint64 ptr) as ma_result
declare function ma_engine_get_node_graph(byval pEngine as ma_engine ptr) as ma_node_graph ptr
declare function ma_engine_get_resource_manager(byval pEngine as ma_engine ptr) as ma_resource_manager ptr
declare function ma_engine_get_device(byval pEngine as ma_engine ptr) as ma_device ptr
declare function ma_engine_get_log(byval pEngine as ma_engine ptr) as ma_log ptr
declare function ma_engine_get_endpoint(byval pEngine as ma_engine ptr) as ma_node ptr
declare function ma_engine_get_time(byval pEngine as const ma_engine ptr) as ma_uint64
declare function ma_engine_set_time(byval pEngine as ma_engine ptr, byval globalTime as ma_uint64) as ma_result
declare function ma_engine_get_channels(byval pEngine as const ma_engine ptr) as ma_uint32
declare function ma_engine_get_sample_rate(byval pEngine as const ma_engine ptr) as ma_uint32
declare function ma_engine_start(byval pEngine as ma_engine ptr) as ma_result
declare function ma_engine_stop(byval pEngine as ma_engine ptr) as ma_result
declare function ma_engine_set_volume(byval pEngine as ma_engine ptr, byval volume as single) as ma_result
declare function ma_engine_set_gain_db(byval pEngine as ma_engine ptr, byval gainDB as single) as ma_result
declare function ma_engine_get_listener_count(byval pEngine as const ma_engine ptr) as ma_uint32
declare function ma_engine_find_closest_listener(byval pEngine as const ma_engine ptr, byval absolutePosX as single, byval absolutePosY as single, byval absolutePosZ as single) as ma_uint32
declare sub ma_engine_listener_set_position(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval x as single, byval y as single, byval z as single)
declare function ma_engine_listener_get_position(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32) as ma_vec3f
declare sub ma_engine_listener_set_direction(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval x as single, byval y as single, byval z as single)
declare function ma_engine_listener_get_direction(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32) as ma_vec3f
declare sub ma_engine_listener_set_velocity(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval x as single, byval y as single, byval z as single)
declare function ma_engine_listener_get_velocity(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32) as ma_vec3f
declare sub ma_engine_listener_set_cone(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval innerAngleInRadians as single, byval outerAngleInRadians as single, byval outerGain as single)
declare sub ma_engine_listener_get_cone(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32, byval pInnerAngleInRadians as single ptr, byval pOuterAngleInRadians as single ptr, byval pOuterGain as single ptr)
declare sub ma_engine_listener_set_world_up(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval x as single, byval y as single, byval z as single)
declare function ma_engine_listener_get_world_up(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32) as ma_vec3f
declare sub ma_engine_listener_set_enabled(byval pEngine as ma_engine ptr, byval listenerIndex as ma_uint32, byval isEnabled as ma_bool32)
declare function ma_engine_listener_is_enabled(byval pEngine as const ma_engine ptr, byval listenerIndex as ma_uint32) as ma_bool32
declare function ma_engine_play_sound_ex(byval pEngine as ma_engine ptr, byval pFilePath as const zstring ptr, byval pNode as ma_node ptr, byval nodeInputBusIndex as ma_uint32) as ma_result
declare function ma_engine_play_sound(byval pEngine as ma_engine ptr, byval pFilePath as const zstring ptr, byval pGroup as ma_sound_group ptr) as ma_result
declare function ma_sound_init_from_file(byval pEngine as ma_engine ptr, byval pFilePath as const zstring ptr, byval flags as ma_uint32, byval pGroup as ma_sound_group ptr, byval pDoneFence as ma_fence ptr, byval pSound as ma_sound ptr) as ma_result
declare function ma_sound_init_from_file_w(byval pEngine as ma_engine ptr, byval pFilePath as const wstring ptr, byval flags as ma_uint32, byval pGroup as ma_sound_group ptr, byval pDoneFence as ma_fence ptr, byval pSound as ma_sound ptr) as ma_result
declare function ma_sound_init_copy(byval pEngine as ma_engine ptr, byval pExistingSound as const ma_sound ptr, byval flags as ma_uint32, byval pGroup as ma_sound_group ptr, byval pSound as ma_sound ptr) as ma_result
declare function ma_sound_init_from_data_source(byval pEngine as ma_engine ptr, byval pDataSource as ma_data_source ptr, byval flags as ma_uint32, byval pGroup as ma_sound_group ptr, byval pSound as ma_sound ptr) as ma_result
declare function ma_sound_init_ex(byval pEngine as ma_engine ptr, byval pConfig as const ma_sound_config ptr, byval pSound as ma_sound ptr) as ma_result
declare sub ma_sound_uninit(byval pSound as ma_sound ptr)
declare function ma_sound_get_engine(byval pSound as const ma_sound ptr) as ma_engine ptr
declare function ma_sound_get_data_source(byval pSound as const ma_sound ptr) as ma_data_source ptr
declare function ma_sound_start(byval pSound as ma_sound ptr) as ma_result
declare function ma_sound_stop(byval pSound as ma_sound ptr) as ma_result
declare sub ma_sound_set_volume(byval pSound as ma_sound ptr, byval volume as single)
declare function ma_sound_get_volume(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_pan(byval pSound as ma_sound ptr, byval pan as single)
declare function ma_sound_get_pan(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_pan_mode(byval pSound as ma_sound ptr, byval panMode as ma_pan_mode)
declare function ma_sound_get_pan_mode(byval pSound as const ma_sound ptr) as ma_pan_mode
declare sub ma_sound_set_pitch(byval pSound as ma_sound ptr, byval pitch as single)
declare function ma_sound_get_pitch(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_spatialization_enabled(byval pSound as ma_sound ptr, byval enabled as ma_bool32)
declare function ma_sound_is_spatialization_enabled(byval pSound as const ma_sound ptr) as ma_bool32
declare sub ma_sound_set_pinned_listener_index(byval pSound as ma_sound ptr, byval listenerIndex as ma_uint32)
declare function ma_sound_get_pinned_listener_index(byval pSound as const ma_sound ptr) as ma_uint32
declare function ma_sound_get_listener_index(byval pSound as const ma_sound ptr) as ma_uint32
declare function ma_sound_get_direction_to_listener(byval pSound as const ma_sound ptr) as ma_vec3f
declare sub ma_sound_set_position(byval pSound as ma_sound ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_get_position(byval pSound as const ma_sound ptr) as ma_vec3f
declare sub ma_sound_set_direction(byval pSound as ma_sound ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_get_direction(byval pSound as const ma_sound ptr) as ma_vec3f
declare sub ma_sound_set_velocity(byval pSound as ma_sound ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_get_velocity(byval pSound as const ma_sound ptr) as ma_vec3f
declare sub ma_sound_set_attenuation_model(byval pSound as ma_sound ptr, byval attenuationModel as ma_attenuation_model)
declare function ma_sound_get_attenuation_model(byval pSound as const ma_sound ptr) as ma_attenuation_model
declare sub ma_sound_set_positioning(byval pSound as ma_sound ptr, byval positioning as ma_positioning)
declare function ma_sound_get_positioning(byval pSound as const ma_sound ptr) as ma_positioning
declare sub ma_sound_set_rolloff(byval pSound as ma_sound ptr, byval rolloff as single)
declare function ma_sound_get_rolloff(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_min_gain(byval pSound as ma_sound ptr, byval minGain as single)
declare function ma_sound_get_min_gain(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_max_gain(byval pSound as ma_sound ptr, byval maxGain as single)
declare function ma_sound_get_max_gain(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_min_distance(byval pSound as ma_sound ptr, byval minDistance as single)
declare function ma_sound_get_min_distance(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_max_distance(byval pSound as ma_sound ptr, byval maxDistance as single)
declare function ma_sound_get_max_distance(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_cone(byval pSound as ma_sound ptr, byval innerAngleInRadians as single, byval outerAngleInRadians as single, byval outerGain as single)
declare sub ma_sound_get_cone(byval pSound as const ma_sound ptr, byval pInnerAngleInRadians as single ptr, byval pOuterAngleInRadians as single ptr, byval pOuterGain as single ptr)
declare sub ma_sound_set_doppler_factor(byval pSound as ma_sound ptr, byval dopplerFactor as single)
declare function ma_sound_get_doppler_factor(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_directional_attenuation_factor(byval pSound as ma_sound ptr, byval directionalAttenuationFactor as single)
declare function ma_sound_get_directional_attenuation_factor(byval pSound as const ma_sound ptr) as single
declare sub ma_sound_set_fade_in_pcm_frames(byval pSound as ma_sound ptr, byval volumeBeg as single, byval volumeEnd as single, byval fadeLengthInFrames as ma_uint64)
declare sub ma_sound_set_fade_in_milliseconds(byval pSound as ma_sound ptr, byval volumeBeg as single, byval volumeEnd as single, byval fadeLengthInMilliseconds as ma_uint64)
declare function ma_sound_get_current_fade_volume(byval pSound as ma_sound ptr) as single
declare sub ma_sound_set_start_time_in_pcm_frames(byval pSound as ma_sound ptr, byval absoluteGlobalTimeInFrames as ma_uint64)
declare sub ma_sound_set_start_time_in_milliseconds(byval pSound as ma_sound ptr, byval absoluteGlobalTimeInMilliseconds as ma_uint64)
declare sub ma_sound_set_stop_time_in_pcm_frames(byval pSound as ma_sound ptr, byval absoluteGlobalTimeInFrames as ma_uint64)
declare sub ma_sound_set_stop_time_in_milliseconds(byval pSound as ma_sound ptr, byval absoluteGlobalTimeInMilliseconds as ma_uint64)
declare function ma_sound_is_playing(byval pSound as const ma_sound ptr) as ma_bool32
declare function ma_sound_get_time_in_pcm_frames(byval pSound as const ma_sound ptr) as ma_uint64
declare sub ma_sound_set_looping(byval pSound as ma_sound ptr, byval isLooping as ma_bool32)
declare function ma_sound_is_looping(byval pSound as const ma_sound ptr) as ma_bool32
declare function ma_sound_at_end(byval pSound as const ma_sound ptr) as ma_bool32
declare function ma_sound_seek_to_pcm_frame(byval pSound as ma_sound ptr, byval frameIndex as ma_uint64) as ma_result
declare function ma_sound_get_data_format(byval pSound as ma_sound ptr, byval pFormat as ma_format ptr, byval pChannels as ma_uint32 ptr, byval pSampleRate as ma_uint32 ptr, byval pChannelMap as ma_channel ptr, byval channelMapCap as uinteger) as ma_result
declare function ma_sound_get_cursor_in_pcm_frames(byval pSound as ma_sound ptr, byval pCursor as ma_uint64 ptr) as ma_result
declare function ma_sound_get_length_in_pcm_frames(byval pSound as ma_sound ptr, byval pLength as ma_uint64 ptr) as ma_result
declare function ma_sound_get_cursor_in_seconds(byval pSound as ma_sound ptr, byval pCursor as single ptr) as ma_result
declare function ma_sound_get_length_in_seconds(byval pSound as ma_sound ptr, byval pLength as single ptr) as ma_result
declare function ma_sound_group_init(byval pEngine as ma_engine ptr, byval flags as ma_uint32, byval pParentGroup as ma_sound_group ptr, byval pGroup as ma_sound_group ptr) as ma_result
declare function ma_sound_group_init_ex(byval pEngine as ma_engine ptr, byval pConfig as const ma_sound_group_config ptr, byval pGroup as ma_sound_group ptr) as ma_result
declare sub ma_sound_group_uninit(byval pGroup as ma_sound_group ptr)
declare function ma_sound_group_get_engine(byval pGroup as const ma_sound_group ptr) as ma_engine ptr
declare function ma_sound_group_start(byval pGroup as ma_sound_group ptr) as ma_result
declare function ma_sound_group_stop(byval pGroup as ma_sound_group ptr) as ma_result
declare sub ma_sound_group_set_volume(byval pGroup as ma_sound_group ptr, byval volume as single)
declare function ma_sound_group_get_volume(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_pan(byval pGroup as ma_sound_group ptr, byval pan as single)
declare function ma_sound_group_get_pan(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_pan_mode(byval pGroup as ma_sound_group ptr, byval panMode as ma_pan_mode)
declare function ma_sound_group_get_pan_mode(byval pGroup as const ma_sound_group ptr) as ma_pan_mode
declare sub ma_sound_group_set_pitch(byval pGroup as ma_sound_group ptr, byval pitch as single)
declare function ma_sound_group_get_pitch(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_spatialization_enabled(byval pGroup as ma_sound_group ptr, byval enabled as ma_bool32)
declare function ma_sound_group_is_spatialization_enabled(byval pGroup as const ma_sound_group ptr) as ma_bool32
declare sub ma_sound_group_set_pinned_listener_index(byval pGroup as ma_sound_group ptr, byval listenerIndex as ma_uint32)
declare function ma_sound_group_get_pinned_listener_index(byval pGroup as const ma_sound_group ptr) as ma_uint32
declare function ma_sound_group_get_listener_index(byval pGroup as const ma_sound_group ptr) as ma_uint32
declare function ma_sound_group_get_direction_to_listener(byval pGroup as const ma_sound_group ptr) as ma_vec3f
declare sub ma_sound_group_set_position(byval pGroup as ma_sound_group ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_group_get_position(byval pGroup as const ma_sound_group ptr) as ma_vec3f
declare sub ma_sound_group_set_direction(byval pGroup as ma_sound_group ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_group_get_direction(byval pGroup as const ma_sound_group ptr) as ma_vec3f
declare sub ma_sound_group_set_velocity(byval pGroup as ma_sound_group ptr, byval x as single, byval y as single, byval z as single)
declare function ma_sound_group_get_velocity(byval pGroup as const ma_sound_group ptr) as ma_vec3f
declare sub ma_sound_group_set_attenuation_model(byval pGroup as ma_sound_group ptr, byval attenuationModel as ma_attenuation_model)
declare function ma_sound_group_get_attenuation_model(byval pGroup as const ma_sound_group ptr) as ma_attenuation_model
declare sub ma_sound_group_set_positioning(byval pGroup as ma_sound_group ptr, byval positioning as ma_positioning)
declare function ma_sound_group_get_positioning(byval pGroup as const ma_sound_group ptr) as ma_positioning
declare sub ma_sound_group_set_rolloff(byval pGroup as ma_sound_group ptr, byval rolloff as single)
declare function ma_sound_group_get_rolloff(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_min_gain(byval pGroup as ma_sound_group ptr, byval minGain as single)
declare function ma_sound_group_get_min_gain(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_max_gain(byval pGroup as ma_sound_group ptr, byval maxGain as single)
declare function ma_sound_group_get_max_gain(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_min_distance(byval pGroup as ma_sound_group ptr, byval minDistance as single)
declare function ma_sound_group_get_min_distance(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_max_distance(byval pGroup as ma_sound_group ptr, byval maxDistance as single)
declare function ma_sound_group_get_max_distance(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_cone(byval pGroup as ma_sound_group ptr, byval innerAngleInRadians as single, byval outerAngleInRadians as single, byval outerGain as single)
declare sub ma_sound_group_get_cone(byval pGroup as const ma_sound_group ptr, byval pInnerAngleInRadians as single ptr, byval pOuterAngleInRadians as single ptr, byval pOuterGain as single ptr)
declare sub ma_sound_group_set_doppler_factor(byval pGroup as ma_sound_group ptr, byval dopplerFactor as single)
declare function ma_sound_group_get_doppler_factor(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_directional_attenuation_factor(byval pGroup as ma_sound_group ptr, byval directionalAttenuationFactor as single)
declare function ma_sound_group_get_directional_attenuation_factor(byval pGroup as const ma_sound_group ptr) as single
declare sub ma_sound_group_set_fade_in_pcm_frames(byval pGroup as ma_sound_group ptr, byval volumeBeg as single, byval volumeEnd as single, byval fadeLengthInFrames as ma_uint64)
declare sub ma_sound_group_set_fade_in_milliseconds(byval pGroup as ma_sound_group ptr, byval volumeBeg as single, byval volumeEnd as single, byval fadeLengthInMilliseconds as ma_uint64)
declare function ma_sound_group_get_current_fade_volume(byval pGroup as ma_sound_group ptr) as single
declare sub ma_sound_group_set_start_time_in_pcm_frames(byval pGroup as ma_sound_group ptr, byval absoluteGlobalTimeInFrames as ma_uint64)
declare sub ma_sound_group_set_start_time_in_milliseconds(byval pGroup as ma_sound_group ptr, byval absoluteGlobalTimeInMilliseconds as ma_uint64)
declare sub ma_sound_group_set_stop_time_in_pcm_frames(byval pGroup as ma_sound_group ptr, byval absoluteGlobalTimeInFrames as ma_uint64)
declare sub ma_sound_group_set_stop_time_in_milliseconds(byval pGroup as ma_sound_group ptr, byval absoluteGlobalTimeInMilliseconds as ma_uint64)
declare function ma_sound_group_is_playing(byval pGroup as const ma_sound_group ptr) as ma_bool32
declare function ma_sound_group_get_time_in_pcm_frames(byval pGroup as const ma_sound_group ptr) as ma_uint64

end extern

#iFNDEF __FB_64BIT__
	#inclib "miniaudio32"
#else
	#inclib "miniaudio64"
#endif