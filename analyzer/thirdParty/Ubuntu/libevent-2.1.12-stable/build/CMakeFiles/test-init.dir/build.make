# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build

# Include any dependencies generated for this target.
include CMakeFiles/test-init.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test-init.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test-init.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-init.dir/flags.make

CMakeFiles/test-init.dir/test/test-init.c.o: CMakeFiles/test-init.dir/flags.make
CMakeFiles/test-init.dir/test/test-init.c.o: ../test/test-init.c
CMakeFiles/test-init.dir/test/test-init.c.o: CMakeFiles/test-init.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test-init.dir/test/test-init.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test-init.dir/test/test-init.c.o -MF CMakeFiles/test-init.dir/test/test-init.c.o.d -o CMakeFiles/test-init.dir/test/test-init.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/test/test-init.c

CMakeFiles/test-init.dir/test/test-init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test-init.dir/test/test-init.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/test/test-init.c > CMakeFiles/test-init.dir/test/test-init.c.i

CMakeFiles/test-init.dir/test/test-init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test-init.dir/test/test-init.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/test/test-init.c -o CMakeFiles/test-init.dir/test/test-init.c.s

# Object files for target test-init
test__init_OBJECTS = \
"CMakeFiles/test-init.dir/test/test-init.c.o"

# External object files for target test-init
test__init_EXTERNAL_OBJECTS =

bin/test-init: CMakeFiles/test-init.dir/test/test-init.c.o
bin/test-init: CMakeFiles/test-init.dir/build.make
bin/test-init: /usr/lib/x86_64-linux-gnu/libssl.so
bin/test-init: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/test-init: /usr/lib/x86_64-linux-gnu/libz.so
bin/test-init: lib/libevent_extra-2.1.so.7.0.1
bin/test-init: lib/libevent_core-2.1.so.7.0.1
bin/test-init: CMakeFiles/test-init.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/test-init"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-init.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-init.dir/build: bin/test-init
.PHONY : CMakeFiles/test-init.dir/build

CMakeFiles/test-init.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-init.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-init.dir/clean

CMakeFiles/test-init.dir/depend:
	cd /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles/test-init.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-init.dir/depend

