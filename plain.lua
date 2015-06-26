
lib=require("hidusblib")
tab = { 0x00, 0x55, 0x53, 0x42, 0x43, 0xff, 0xff, 0xff, 0xf2 }
lib.set_writeBuf_from_table(tab,9)
statu=lib.enumerate(0x1130,0x3132)
if statu~=0 then
	lib.hid_open(0x1130,0x3132)
	lib.hid_write(10);
	res=lib.hid_read_timeout(65,1000)
end

idx=0
while 1 do
	if statu==0 then
		if lib.enumerate(0x1130,0x3132)>0 then
			statu = 1
			lib.hid_open(0x1130,0x3132)
			print("Reconnect")
		else
			idx = 0
			print("No connect")
		end
	else
		res=lib.hid_read_timeout(41,50)
		if(res>0)then
			tab = lib.get_readBuf(40)
			for k,v in ipairs(tab) do
				print(k..":"..v)
			end
		else
			if lib.enumerate(0x1130,0x3132)>0 then
				lib.hid_write(9);
			else
				statu = 0
				print("Disconnect")
			end
		end
		idx=idx+1
		if(idx>50)then
			break
		end
		print(idx)
	end
end
-- ]]
-- path,vendor_id,product_id,serial_number,release_number,manufacturer_string,product_string,usage_page,usage,interface_number=lib.get_enum(0)

-- print(lib.get_enum(0))
