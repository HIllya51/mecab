cmake_minimum_required(VERSION 3.10)
project(mecab)

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
target_compile_options(libmecab PRIVATE /EHsc      
                                        /GL         
                                        /GA       
                                        /Ob2        
                                        /W3         
                                        /nologo    
                                        /Zi        
                                        /wd4800    
                                        /wd4305
                                        /wd4244)
target_compile_definitions(
    libmecab PRIVATE
    -D_CRT_SECURE_NO_DEPRECATE
    -DMECAB_USE_THREAD
    -DDLL_EXPORT
    -DHAVE_GETENV
    -DHAVE_WINDOWS_H
    -DDIC_VERSION=102
    -DVERSION="0.996"
    -DPACKAGE="mecab"
    -DUNICODE
    -D_UNICODE
    -DMECAB_DEFAULT_RC="c:\\Program Files\\mecab\\etc\\mecabrc"
)