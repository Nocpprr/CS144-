# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/hgfs/SSH/Project_CS144/lab1/sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build

# Include any dependencies generated for this target.
include doctests/CMakeFiles/parser_dt.dir/depend.make

# Include the progress variables for this target.
include doctests/CMakeFiles/parser_dt.dir/progress.make

# Include the compile flags for this target's objects.
include doctests/CMakeFiles/parser_dt.dir/flags.make

doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.o: doctests/CMakeFiles/parser_dt.dir/flags.make
doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.o: ../doctests/parser_dt.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.o"
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/parser_dt.dir/parser_dt.cc.o -c /mnt/hgfs/SSH/Project_CS144/lab1/sponge/doctests/parser_dt.cc

doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/parser_dt.dir/parser_dt.cc.i"
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/hgfs/SSH/Project_CS144/lab1/sponge/doctests/parser_dt.cc > CMakeFiles/parser_dt.dir/parser_dt.cc.i

doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/parser_dt.dir/parser_dt.cc.s"
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/hgfs/SSH/Project_CS144/lab1/sponge/doctests/parser_dt.cc -o CMakeFiles/parser_dt.dir/parser_dt.cc.s

# Object files for target parser_dt
parser_dt_OBJECTS = \
"CMakeFiles/parser_dt.dir/parser_dt.cc.o"

# External object files for target parser_dt
parser_dt_EXTERNAL_OBJECTS =

doctests/parser_dt: doctests/CMakeFiles/parser_dt.dir/parser_dt.cc.o
doctests/parser_dt: doctests/CMakeFiles/parser_dt.dir/build.make
doctests/parser_dt: libsponge/libsponge.a
doctests/parser_dt: /usr/lib/x86_64-linux-gnu/libpthread.so
doctests/parser_dt: doctests/CMakeFiles/parser_dt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable parser_dt"
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parser_dt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
doctests/CMakeFiles/parser_dt.dir/build: doctests/parser_dt

.PHONY : doctests/CMakeFiles/parser_dt.dir/build

doctests/CMakeFiles/parser_dt.dir/clean:
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests && $(CMAKE_COMMAND) -P CMakeFiles/parser_dt.dir/cmake_clean.cmake
.PHONY : doctests/CMakeFiles/parser_dt.dir/clean

doctests/CMakeFiles/parser_dt.dir/depend:
	cd /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/hgfs/SSH/Project_CS144/lab1/sponge /mnt/hgfs/SSH/Project_CS144/lab1/sponge/doctests /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests /mnt/hgfs/SSH/Project_CS144/lab1/sponge/build/doctests/CMakeFiles/parser_dt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doctests/CMakeFiles/parser_dt.dir/depend

