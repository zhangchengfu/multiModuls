package com.laozhang.utils.eventlistener;

import java.util.EventListener;
//监听接口
public interface ValueChangeListener extends EventListener {
	void perform(ValueChangeEvent e);
}
