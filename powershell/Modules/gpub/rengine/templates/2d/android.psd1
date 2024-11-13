@{
	build = @{
		template = '2d' # Current template to distinguish build path
		finalizer = 'android2d' # Finalizer to use right before moving binaries
		cores = 4 # Cores count used during the build
		platform = 'android' # Target build platform
		architecture = 'auto' # CPU (auto|x86_32|x86_64|arm32|arm64|rv64|ppc32|ppc64|wasm32)
		target = 'template_release' # Release template (template_release|template_debug)
		config = 'auto' # Full rebuild (auto|force|cache)
		use_mingw = 'yes' # Use MinGW (enable LTO) instead of Visual C compiler
		lto = 'full' # (none|auto|thin|full) Use link-time-optimization: significant efficiency, extremely slow
		optimize = 'speed_trace' # Optimization level (none|custom|debug|speed|speed_trace|size
		no_splash = 'no' # Disable editor custom splash screen (yes|no)
	}
	debug = @{
		precise_math = 'no' # Math checks use very precise epsilon (debug option) (yes|no)
		compiledb = 'yes' # Generate compilation DB (`compile_commands.json`) for external tools (yes|no)
		symbols = 'no' # Debug symbols
		separate_symbols = 'no' # Extract debug symbols to a separate file
	}
	tools = @{
		editor = 'no' # Editor tools
		tests = 'no' # Unit tests
		minizip = 'yes' # Use ZIP instead of PCK
		compatibility = 'yes' # Deprecated functionality
		xml = 'yes' # XML support (vital)
		mono = 'no' # C# language support
		upnp = 'yes' # Universal Plug And Play
	}
	vrar = @{
		mobile = 'yes' # Mobile AR/VR support
		camera = 'yes' # AR/VR Camera support
		webxr = 'yes' # Web XR interface for AR/VR
		openxr = @{ support = 'yes'; module = 'yes' } # Godot Open XR drivers
	}
	network = @{
		jsonrpc = 'yes' # JSON-RPC network protocol
		ssl = @{ module = 'yes'; builtin = 'yes' } # Open SSL encryption support
		coop = 'yes' # Multiplayer
		enet = @{ module = 'yes'; builtin = 'yes' } # Coop network
		websocket = @{ module = 'yes'; builtin = 'yes' } # WebSocket protocal support
		webrtc = 'yes' # WebRTC protocol support
		mbedtls = 'yes' # CryptoMbedTLS certificate signing support
		builtin_miniupnpc = 'yes' # UPnP protocol daemon (control point)
	}
	gui = @{
		notadvanced = 'no' # Disable advanced GUI nodes (Graph edit, Tree...)
		fonts = @{
			msdfgen = @{ module = 'yes'; builtin = 'yes' } # Font glyphs resizing
			freetype = @{ module = 'yes'; builtin = 'yes' } # Dynamic fonts (vital)
			brotli = @{ module = 'yes'; builtin = 'yes' }  # WOFF2 format and Brotli fonts decompression support
			graphite = @{ module = 'yes'; builtin = 'yes' } # SIL Graphite unicode tool support
			builtin_harfbuzz = 'yes' # Text Font Engine (position, glyphs convert)
		}
	}
	media = @{
		sound = @{
			minimp3 = 'yes' # MP3 support
			xaudio2 = 'no' # Enable the XAudio2 audio driver
		}
		images = @{
			bitmap = 'yes' # Bitmap images support
			jpg = 'yes' # JPG format support
			webp = 'yes' # WEBP image support
			tinyexr = 'yes' # EXR image format support
			cvtt = 'yes' # CVTT image compression support
			etc1 = 'yes' # ETC1 image compression support
			astcenc = 'yes' # ASTC image compression support
			squish = @{ module = 'yes'; builtin = 'yes' } # Sprite squishing/streching support
		}
		video = @{
			webm = 'yes' # WEBM video support
			theora = @{ module = 'yes'; builtin = 'yes' } # Theora OGG video support
			vp8vorbis = @{ module = 'yes'; builtin = 'yes' } # Webm (VP8) codec support
			vp9opus = @{ module = 'yes'; builtin = 'yes' } # Webm (VP9) codec support
		}
		zip = @{
			support = 'yes' # ZIP project manipulations support
			zlib = 'yes' # Z-Library built-in compression support
			zstd = 'yes' # Z-Standard built-in compression support
		}
	}
	world3d = @{
		disable = 'yes' # Disable 3D
		format = @{
			gltf = 'no' # GLTF format support
			dds = 'no' # DirectDraw Surface format support
			tga = 'no' # TGA format support
		}
		vhacd = 'no' # 3D geometry decomposition support
		csg = 'no' # Constructive Solid Geometry 3D support
		gridmap = 'no' # GridMap 3D level design tool
		meshoptimizer = 'no' # 3D LOD mesh optimizer
		basis_universal = 'no' # 3D universal basis
		builtin_recastnavigation = 'no' # Recast navigation tool
		xatlas = @{ module = 'no'; builtin = 'no' } # 3D Mesh parameterization / UV unwrapping library
	}
	game = @{
		raycast = 'yes' # Raycast project support
		regex = 'yes' # ReGex project support
		pcre2 = @{ builtin = 'yes'; jit = 'yes' } # Perl compatible Regular expressions with JIT compiler
		navigation = 'yes' # Project navigation nodes support
		precision = 'single' # Float poiting numbers precision (single|double)
		rvo2 = @{ d2 = 'yes'; d3 = 'yes' } # Reciprocal collision avoidance support
	}
	procedural = @{
		denoise = 'yes' # Shaders denoise
		noise = 'yes' # Shaders noise
		light = @{
			mapper_rd = 'yes' # GPU based lightmapper
			hdr = 'yes' # High Dynamic Range lighting
			raytrace_embree = 'yes' # Embree Ray tracing lib
		}
		glslang = @{ module = 'yes'; builtin = 'yes' } # OpenGT (ES) shader front end and validator
	}
}
