local M = {}


function M.load()
	local handle = crash.load_previous()
	if not handle then
		return nil
	end

	local c = {}
	c.signum = crash.get_signum(handle)
	c.modules = crash.get_modules(handle)
	c.backtrace = crash.get_backtrace(handle)

	c.sysfields = {}
	c.sysfields.LANGUAGE = crash.get_sys_field(handle, crash.SYSFIELD_LANGUAGE)
	c.sysfields.TERRITORY = crash.get_sys_field(handle, crash.SYSFIELD_TERRITORY)
	c.sysfields.DEVICE_LANGUAGE = crash.get_sys_field(handle, crash.SYSFIELD_DEVICE_LANGUAGE)
	c.sysfields.ENGINE_HASH = crash.get_sys_field(handle, crash.SYSFIELD_ENGINE_HASH)
	c.sysfields.ENGINE_VERSION = crash.get_sys_field(handle, crash.SYSFIELD_ENGINE_VERSION)
	c.sysfields.SYSTEM_NAME = crash.get_sys_field(handle, crash.SYSFIELD_SYSTEM_NAME)
	c.sysfields.SYSTEM_VERSION = crash.get_sys_field(handle, crash.SYSFIELD_SYSTEM_VERSION)
	c.sysfields.DEVICE_MODEL = crash.get_sys_field(handle, crash.SYSFIELD_DEVICE_MODEL)
	c.sysfields.MANUFACTURER = crash.get_sys_field(handle, crash.SYSFIELD_MANUFACTURER)
	c.sysfields.ANDROID_BUILD_FINGERPRINT = crash.get_sys_field(handle, crash.SYSFIELD_ANDROID_BUILD_FINGERPRINT)

	c.extra_data = crash.get_extra_data(handle)
	c.userfields = {}
	for i=0,crash.USERFIELD_MAX-1 do
		c.userfields[i+1] = crash.get_user_field(handle, i)
	end

	crash.release(handle)
	
	return c
end



return M