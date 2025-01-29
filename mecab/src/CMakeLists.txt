cmake_minimum_required(VERSION 3.10)
project(mecab)

# set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

# add_compile_options(/MT)

# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /EHsc /O2 /GL /GA /Ob2 /nologo /W3 /MT /Zi /wd4800 /wd4305 /wd4244")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc /O2 /GL /GA /Ob2 /nologo /W3 /MT /Zi /wd4800 /wd4305 /wd4244")
# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /nologo /OPT:REF /OPT:ICF /LTCG /NXCOMPAT /DYNAMICBASE")
# set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /nologo /OPT:REF /OPT:ICF /LTCG /NXCOMPAT /DYNAMICBASE")


set(SOURCES
    feature_index.cpp param.cpp learner.cpp string_buffer.cpp
    char_property.cpp learner_tagger.cpp tagger.cpp
    connector.cpp tokenizer.cpp
    context_id.cpp dictionary.cpp utils.cpp
    dictionary_compiler.cpp viterbi.cpp
    dictionary_generator.cpp writer.cpp iconv_utils.cpp
    dictionary_rewriter.cpp lbfgs.cpp eval.cpp nbest_generator.cpp libmecab.cpp
)

string(REPLACE ";" ";${CMAKE_CURRENT_SOURCE_DIR}/" SOURCES "${SOURCES}")

add_library(libmecab ${SOURCES})
target_include_directories(libmecab INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

target_compile_definitions(
    libmecab PRIVATE
    -DDIC_VERSION=102
    -D__GNUC__=1
    -D_CRT_SECURE_NO_DEPRECATE
    -DMECAB_USE_THREAD
    -DHAVE_GETENV
    -DHAVE_WINDOWS_H
    -DVERSION=\"@VERSION@\"
    -DPACKAGE=\"mecab\"
    -DUNICODE
    -D_UNICODE
    -DMECAB_DEFAULT_RC="C:\\Program Files\\mecab\\etc\\mecabrc"
)