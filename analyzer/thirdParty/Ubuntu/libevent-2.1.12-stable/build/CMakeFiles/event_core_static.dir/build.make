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
include CMakeFiles/event_core_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/event_core_static.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/event_core_static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/event_core_static.dir/flags.make

CMakeFiles/event_core_static.dir/buffer.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/buffer.c.o: ../buffer.c
CMakeFiles/event_core_static.dir/buffer.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/event_core_static.dir/buffer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/buffer.c.o -MF CMakeFiles/event_core_static.dir/buffer.c.o.d -o CMakeFiles/event_core_static.dir/buffer.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/buffer.c

CMakeFiles/event_core_static.dir/buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/buffer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/buffer.c > CMakeFiles/event_core_static.dir/buffer.c.i

CMakeFiles/event_core_static.dir/buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/buffer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/buffer.c -o CMakeFiles/event_core_static.dir/buffer.c.s

CMakeFiles/event_core_static.dir/bufferevent.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/bufferevent.c.o: ../bufferevent.c
CMakeFiles/event_core_static.dir/bufferevent.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/event_core_static.dir/bufferevent.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/bufferevent.c.o -MF CMakeFiles/event_core_static.dir/bufferevent.c.o.d -o CMakeFiles/event_core_static.dir/bufferevent.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent.c

CMakeFiles/event_core_static.dir/bufferevent.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/bufferevent.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent.c > CMakeFiles/event_core_static.dir/bufferevent.c.i

CMakeFiles/event_core_static.dir/bufferevent.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/bufferevent.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent.c -o CMakeFiles/event_core_static.dir/bufferevent.c.s

CMakeFiles/event_core_static.dir/bufferevent_filter.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/bufferevent_filter.c.o: ../bufferevent_filter.c
CMakeFiles/event_core_static.dir/bufferevent_filter.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/event_core_static.dir/bufferevent_filter.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/bufferevent_filter.c.o -MF CMakeFiles/event_core_static.dir/bufferevent_filter.c.o.d -o CMakeFiles/event_core_static.dir/bufferevent_filter.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_filter.c

CMakeFiles/event_core_static.dir/bufferevent_filter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/bufferevent_filter.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_filter.c > CMakeFiles/event_core_static.dir/bufferevent_filter.c.i

CMakeFiles/event_core_static.dir/bufferevent_filter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/bufferevent_filter.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_filter.c -o CMakeFiles/event_core_static.dir/bufferevent_filter.c.s

CMakeFiles/event_core_static.dir/bufferevent_pair.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/bufferevent_pair.c.o: ../bufferevent_pair.c
CMakeFiles/event_core_static.dir/bufferevent_pair.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/event_core_static.dir/bufferevent_pair.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/bufferevent_pair.c.o -MF CMakeFiles/event_core_static.dir/bufferevent_pair.c.o.d -o CMakeFiles/event_core_static.dir/bufferevent_pair.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_pair.c

CMakeFiles/event_core_static.dir/bufferevent_pair.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/bufferevent_pair.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_pair.c > CMakeFiles/event_core_static.dir/bufferevent_pair.c.i

CMakeFiles/event_core_static.dir/bufferevent_pair.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/bufferevent_pair.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_pair.c -o CMakeFiles/event_core_static.dir/bufferevent_pair.c.s

CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o: ../bufferevent_ratelim.c
CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o -MF CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o.d -o CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_ratelim.c

CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_ratelim.c > CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.i

CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_ratelim.c -o CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.s

CMakeFiles/event_core_static.dir/bufferevent_sock.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/bufferevent_sock.c.o: ../bufferevent_sock.c
CMakeFiles/event_core_static.dir/bufferevent_sock.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/event_core_static.dir/bufferevent_sock.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/bufferevent_sock.c.o -MF CMakeFiles/event_core_static.dir/bufferevent_sock.c.o.d -o CMakeFiles/event_core_static.dir/bufferevent_sock.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_sock.c

CMakeFiles/event_core_static.dir/bufferevent_sock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/bufferevent_sock.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_sock.c > CMakeFiles/event_core_static.dir/bufferevent_sock.c.i

CMakeFiles/event_core_static.dir/bufferevent_sock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/bufferevent_sock.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/bufferevent_sock.c -o CMakeFiles/event_core_static.dir/bufferevent_sock.c.s

CMakeFiles/event_core_static.dir/event.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/event.c.o: ../event.c
CMakeFiles/event_core_static.dir/event.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/event_core_static.dir/event.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/event.c.o -MF CMakeFiles/event_core_static.dir/event.c.o.d -o CMakeFiles/event_core_static.dir/event.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/event.c

CMakeFiles/event_core_static.dir/event.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/event.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/event.c > CMakeFiles/event_core_static.dir/event.c.i

CMakeFiles/event_core_static.dir/event.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/event.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/event.c -o CMakeFiles/event_core_static.dir/event.c.s

CMakeFiles/event_core_static.dir/evmap.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/evmap.c.o: ../evmap.c
CMakeFiles/event_core_static.dir/evmap.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/event_core_static.dir/evmap.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/evmap.c.o -MF CMakeFiles/event_core_static.dir/evmap.c.o.d -o CMakeFiles/event_core_static.dir/evmap.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evmap.c

CMakeFiles/event_core_static.dir/evmap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/evmap.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evmap.c > CMakeFiles/event_core_static.dir/evmap.c.i

CMakeFiles/event_core_static.dir/evmap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/evmap.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evmap.c -o CMakeFiles/event_core_static.dir/evmap.c.s

CMakeFiles/event_core_static.dir/evthread.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/evthread.c.o: ../evthread.c
CMakeFiles/event_core_static.dir/evthread.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/event_core_static.dir/evthread.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/evthread.c.o -MF CMakeFiles/event_core_static.dir/evthread.c.o.d -o CMakeFiles/event_core_static.dir/evthread.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evthread.c

CMakeFiles/event_core_static.dir/evthread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/evthread.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evthread.c > CMakeFiles/event_core_static.dir/evthread.c.i

CMakeFiles/event_core_static.dir/evthread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/evthread.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evthread.c -o CMakeFiles/event_core_static.dir/evthread.c.s

CMakeFiles/event_core_static.dir/evutil.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/evutil.c.o: ../evutil.c
CMakeFiles/event_core_static.dir/evutil.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/event_core_static.dir/evutil.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/evutil.c.o -MF CMakeFiles/event_core_static.dir/evutil.c.o.d -o CMakeFiles/event_core_static.dir/evutil.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil.c

CMakeFiles/event_core_static.dir/evutil.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/evutil.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil.c > CMakeFiles/event_core_static.dir/evutil.c.i

CMakeFiles/event_core_static.dir/evutil.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/evutil.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil.c -o CMakeFiles/event_core_static.dir/evutil.c.s

CMakeFiles/event_core_static.dir/evutil_rand.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/evutil_rand.c.o: ../evutil_rand.c
CMakeFiles/event_core_static.dir/evutil_rand.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/event_core_static.dir/evutil_rand.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/evutil_rand.c.o -MF CMakeFiles/event_core_static.dir/evutil_rand.c.o.d -o CMakeFiles/event_core_static.dir/evutil_rand.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_rand.c

CMakeFiles/event_core_static.dir/evutil_rand.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/evutil_rand.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_rand.c > CMakeFiles/event_core_static.dir/evutil_rand.c.i

CMakeFiles/event_core_static.dir/evutil_rand.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/evutil_rand.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_rand.c -o CMakeFiles/event_core_static.dir/evutil_rand.c.s

CMakeFiles/event_core_static.dir/evutil_time.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/evutil_time.c.o: ../evutil_time.c
CMakeFiles/event_core_static.dir/evutil_time.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/event_core_static.dir/evutil_time.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/evutil_time.c.o -MF CMakeFiles/event_core_static.dir/evutil_time.c.o.d -o CMakeFiles/event_core_static.dir/evutil_time.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_time.c

CMakeFiles/event_core_static.dir/evutil_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/evutil_time.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_time.c > CMakeFiles/event_core_static.dir/evutil_time.c.i

CMakeFiles/event_core_static.dir/evutil_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/evutil_time.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/evutil_time.c -o CMakeFiles/event_core_static.dir/evutil_time.c.s

CMakeFiles/event_core_static.dir/listener.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/listener.c.o: ../listener.c
CMakeFiles/event_core_static.dir/listener.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/event_core_static.dir/listener.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/listener.c.o -MF CMakeFiles/event_core_static.dir/listener.c.o.d -o CMakeFiles/event_core_static.dir/listener.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/listener.c

CMakeFiles/event_core_static.dir/listener.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/listener.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/listener.c > CMakeFiles/event_core_static.dir/listener.c.i

CMakeFiles/event_core_static.dir/listener.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/listener.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/listener.c -o CMakeFiles/event_core_static.dir/listener.c.s

CMakeFiles/event_core_static.dir/log.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/log.c.o: ../log.c
CMakeFiles/event_core_static.dir/log.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/event_core_static.dir/log.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/log.c.o -MF CMakeFiles/event_core_static.dir/log.c.o.d -o CMakeFiles/event_core_static.dir/log.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/log.c

CMakeFiles/event_core_static.dir/log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/log.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/log.c > CMakeFiles/event_core_static.dir/log.c.i

CMakeFiles/event_core_static.dir/log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/log.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/log.c -o CMakeFiles/event_core_static.dir/log.c.s

CMakeFiles/event_core_static.dir/signal.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/signal.c.o: ../signal.c
CMakeFiles/event_core_static.dir/signal.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/event_core_static.dir/signal.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/signal.c.o -MF CMakeFiles/event_core_static.dir/signal.c.o.d -o CMakeFiles/event_core_static.dir/signal.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/signal.c

CMakeFiles/event_core_static.dir/signal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/signal.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/signal.c > CMakeFiles/event_core_static.dir/signal.c.i

CMakeFiles/event_core_static.dir/signal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/signal.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/signal.c -o CMakeFiles/event_core_static.dir/signal.c.s

CMakeFiles/event_core_static.dir/strlcpy.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/strlcpy.c.o: ../strlcpy.c
CMakeFiles/event_core_static.dir/strlcpy.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/event_core_static.dir/strlcpy.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/strlcpy.c.o -MF CMakeFiles/event_core_static.dir/strlcpy.c.o.d -o CMakeFiles/event_core_static.dir/strlcpy.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/strlcpy.c

CMakeFiles/event_core_static.dir/strlcpy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/strlcpy.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/strlcpy.c > CMakeFiles/event_core_static.dir/strlcpy.c.i

CMakeFiles/event_core_static.dir/strlcpy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/strlcpy.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/strlcpy.c -o CMakeFiles/event_core_static.dir/strlcpy.c.s

CMakeFiles/event_core_static.dir/select.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/select.c.o: ../select.c
CMakeFiles/event_core_static.dir/select.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/event_core_static.dir/select.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/select.c.o -MF CMakeFiles/event_core_static.dir/select.c.o.d -o CMakeFiles/event_core_static.dir/select.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/select.c

CMakeFiles/event_core_static.dir/select.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/select.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/select.c > CMakeFiles/event_core_static.dir/select.c.i

CMakeFiles/event_core_static.dir/select.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/select.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/select.c -o CMakeFiles/event_core_static.dir/select.c.s

CMakeFiles/event_core_static.dir/poll.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/poll.c.o: ../poll.c
CMakeFiles/event_core_static.dir/poll.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/event_core_static.dir/poll.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/poll.c.o -MF CMakeFiles/event_core_static.dir/poll.c.o.d -o CMakeFiles/event_core_static.dir/poll.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/poll.c

CMakeFiles/event_core_static.dir/poll.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/poll.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/poll.c > CMakeFiles/event_core_static.dir/poll.c.i

CMakeFiles/event_core_static.dir/poll.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/poll.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/poll.c -o CMakeFiles/event_core_static.dir/poll.c.s

CMakeFiles/event_core_static.dir/epoll.c.o: CMakeFiles/event_core_static.dir/flags.make
CMakeFiles/event_core_static.dir/epoll.c.o: ../epoll.c
CMakeFiles/event_core_static.dir/epoll.c.o: CMakeFiles/event_core_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/event_core_static.dir/epoll.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_core_static.dir/epoll.c.o -MF CMakeFiles/event_core_static.dir/epoll.c.o.d -o CMakeFiles/event_core_static.dir/epoll.c.o -c /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/epoll.c

CMakeFiles/event_core_static.dir/epoll.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_core_static.dir/epoll.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/epoll.c > CMakeFiles/event_core_static.dir/epoll.c.i

CMakeFiles/event_core_static.dir/epoll.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_core_static.dir/epoll.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/epoll.c -o CMakeFiles/event_core_static.dir/epoll.c.s

# Object files for target event_core_static
event_core_static_OBJECTS = \
"CMakeFiles/event_core_static.dir/buffer.c.o" \
"CMakeFiles/event_core_static.dir/bufferevent.c.o" \
"CMakeFiles/event_core_static.dir/bufferevent_filter.c.o" \
"CMakeFiles/event_core_static.dir/bufferevent_pair.c.o" \
"CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o" \
"CMakeFiles/event_core_static.dir/bufferevent_sock.c.o" \
"CMakeFiles/event_core_static.dir/event.c.o" \
"CMakeFiles/event_core_static.dir/evmap.c.o" \
"CMakeFiles/event_core_static.dir/evthread.c.o" \
"CMakeFiles/event_core_static.dir/evutil.c.o" \
"CMakeFiles/event_core_static.dir/evutil_rand.c.o" \
"CMakeFiles/event_core_static.dir/evutil_time.c.o" \
"CMakeFiles/event_core_static.dir/listener.c.o" \
"CMakeFiles/event_core_static.dir/log.c.o" \
"CMakeFiles/event_core_static.dir/signal.c.o" \
"CMakeFiles/event_core_static.dir/strlcpy.c.o" \
"CMakeFiles/event_core_static.dir/select.c.o" \
"CMakeFiles/event_core_static.dir/poll.c.o" \
"CMakeFiles/event_core_static.dir/epoll.c.o"

# External object files for target event_core_static
event_core_static_EXTERNAL_OBJECTS =

lib/libevent_core.a: CMakeFiles/event_core_static.dir/buffer.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/bufferevent.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/bufferevent_filter.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/bufferevent_pair.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/bufferevent_ratelim.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/bufferevent_sock.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/event.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/evmap.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/evthread.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/evutil.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/evutil_rand.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/evutil_time.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/listener.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/log.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/signal.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/strlcpy.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/select.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/poll.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/epoll.c.o
lib/libevent_core.a: CMakeFiles/event_core_static.dir/build.make
lib/libevent_core.a: CMakeFiles/event_core_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking C static library lib/libevent_core.a"
	$(CMAKE_COMMAND) -P CMakeFiles/event_core_static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/event_core_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/event_core_static.dir/build: lib/libevent_core.a
.PHONY : CMakeFiles/event_core_static.dir/build

CMakeFiles/event_core_static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/event_core_static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/event_core_static.dir/clean

CMakeFiles/event_core_static.dir/depend:
	cd /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build /home/kaiwenyu/ThirdParty/libevent-2.1.12-stable/build/CMakeFiles/event_core_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/event_core_static.dir/depend
