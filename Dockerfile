FROM openjdk:8-jre-alpine

MAINTAINER Francisco Javier Ahijado <icesoft@icesoft.blog>

ENV JVM_MEM_MIN_HEAP_SIZE 256m
ENV JVM_MEM_MAX_HEAP_SIZE 1024m
ENV JVM_MEM_YOUNG_GEN_HEAP_SIZE 256m
ENV JVM_MEM_STACK_SIZE 4m
ENV JVM_COMPRESSED_CLASS_SPACE_SIZE 16m
#ENV JVM_MAX_METASPACE_EXPANSION 0
#ENV JVM_MAX_METASPACE_SIZE 64m
ENV JVM_RESERVED_CODE_CACHE_SIZE 24m
ENV JVM_MAX_RAM_FRACTION 1

ENV MALLOC_ARENA_MAX 2
ENV MALLOC_MMAP_THRESHOLD 131072
ENV MALLOC_TRIM_THRESHOLD 131072
ENV MALLOC_TOP_PAD 131072
ENV MALLOC_MMAP_MAX 65536

ENV JAVA_OPTS -server \
    -Xms${JVM_MEM_MIN_HEAP_SIZE} -Xmx${JVM_MEM_MAX_HEAP_SIZE} -Xmn${JVM_MEM_YOUNG_GEN_HEAP_SIZE} -Xss${JVM_MEM_STACK_SIZE} \
    -Djava.security.egd=file:/dev/./urandom \
    -Djava.awt.headless=true \
    -Dfile.encoding=UTF-8 \
    -XX:CompressedClassSpaceSize=${JVM_COMPRESSED_CLASS_SPACE_SIZE} \
    -XX:ReservedCodeCacheSize=${JVM_RESERVED_CODE_CACHE_SIZE} -XX:+UnlockExperimentalVMOptions \
    -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=${JVM_MAX_RAM_FRACTION}
#    -XX:MaxMetaspaceExpansion=${JVM_MAX_METASPACE_EXPANSION} -XX:MaxMetaspaceSize=${JVM_MAX_METASPACE_SIZE} \

RUN set -x \
 && export MALLOC_ARENA_MAX=${MALLOC_ARENA_MAX} \
 && export MALLOC_MMAP_THRESHOLD_=${MALLOC_MMAP_THRESHOLD} \
 && export MALLOC_TRIM_THRESHOLD_=${MALLOC_TRIM_THRESHOLD} \
 && export MALLOC_TOP_PAD_=${MALLOC_TOP_PAD} \
 && export MALLOC_MMAP_MAX_=${MALLOC_MMAP_MAX} \
 && export JAVA_OPTS=${JAVA_OPTS} 
