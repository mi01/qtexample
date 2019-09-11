
dofile "premake/premake_helper.lua"

-----------------------------------------------------------------------------------------

solution "QtExample"

	configurations {
		"Release",
		"Debug"
	}

	-- global settings
	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }
		targetdir "build/debug"
 
	configuration "Release"
		defines { "NDEBUG", "QT_NO_DEBUG" }
		flags { "Optimize", "OptimizeSpeed" }
		targetdir "build/release"

	project "QtExample"
		kind "WindowedApp"
		language "C++"
		objdir "obj"

		files {
			"src/**.h",
			"src/**.cpp"
		}

		excludes {
			"src/qt/moc/**.cpp"
		}

		-- This option causes the compiler to abort compilation on the first
		-- error occurred rather than trying to keep going and printing fur-
		-- ther error messages.
		-- This should avoid confusion of C++-newbies because they only get
		-- one error msg. They won't try to fix a problem which does not
		-- exist.
		buildoptions {
			"-Wfatal-errors"
		}

		-- more warnings are always good
		buildoptions {
			"-fPIC",
			"-Wpointer-arith",
			"-Wcast-qual",
			"-Wwrite-strings",
			"-Wno-long-long",
			"-Wno-variadic-macros",
			"-Wno-multichar",
			"-Woverloaded-virtual"
		}

		-- enable support for c++11
		buildoptions { "-std=c++0x" }

		buildoptions { "-m" .. os.bitcounter() }

		defines {
			"QT_GUI_LIB",
			"QT_CORE_LIB",
			"QT_SHARED",
			"QT_OPENGL_LIB"
		}

		includedirs {
			"/usr/include/qt",
			"/usr/include/qt/QtWidgets",
			"/usr/include/qt/QtGui",
			"/usr/include/qt/QtCore",
			"/usr/include/qt/QtOpenGL"
		}
		
		links {
			"Qt5Gui",
			"Qt5Core",
			"Qt5OpenGL",
			"Qt5Widgets"
		}
