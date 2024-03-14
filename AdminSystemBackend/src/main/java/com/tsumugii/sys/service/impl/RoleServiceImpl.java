package com.tsumugii.sys.service.impl;

import com.tsumugii.sys.entity.Role;
import com.tsumugii.sys.mapper.RoleMapper;
import com.tsumugii.sys.service.IRoleService;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}
