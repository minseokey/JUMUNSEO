package com.jumunseo.debate.global.stomp;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RedisChannelService {
    private final RedisMessageListenerContainer container;
    private final MessageListenerAdapter listenerAdapter;

    // 사용할 채널 등록. -> 주제의 등록과 동시에 채널을 올려야 한다.
    public void registerChannel(String channelName) {
        ChannelTopic topic = new ChannelTopic(channelName);
        container.addMessageListener(listenerAdapter, topic);
    }

    // 사용할 채널 해제. -> 기한이 끝날때 채널 종료 및 이와 동시에 요약 진행.
    public void unregisterChannel(String channelName) {
        ChannelTopic topic = new ChannelTopic(channelName);
        container.removeMessageListener(listenerAdapter, topic);
    }
}
