package com.tsumugii.sys.service.impl;

import com.tsumugii.sys.entity.Menu;
import com.tsumugii.sys.mapper.MenuMapper;
import com.tsumugii.sys.service.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author tsumugii
 * @since 2023-03-23
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

}
