package lua;

import "core:os"
import "core:c"

when os.OS == "windows" do foreign import lua "system:lua53.lib";
when os.OS == "linux" do foreign import lua "system:lua53";
when os.OS == "darwin" do foreign import lua "system:lua53";

@(default_calling_convention = "c")
foreign lua {
	// lua_pushfstring :: proc (L: ^lua_State , fmt: cstring , ...) -> cstring ---;
	// lua_pushvfstring :: proc (L: ^lua_State , fmt: cstring , va_list argp) -> cstring ---;
	
	lua_absindex :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_arith :: proc (L: ^lua_State , op: c.int ) ---;
	lua_atpanic :: proc (L: ^lua_State ,  panicf: lua_CFunction) -> lua_CFunction ---;
	lua_callk :: proc (L: ^lua_State , nargs: c.int, nresults: c.int,ctx: lua_KContext , k: lua_KFunction ) ---;
	lua_checkstack :: proc (L: ^lua_State , n: c.int ) -> c.int ---;
	lua_close :: proc (L: ^lua_State ) ---;
	lua_compare :: proc (L: ^lua_State ,  idx1: c.int,  idx2: c.int,  op: c.int) -> c.int ---;
	lua_concat :: proc (L: ^lua_State , n: c.int) ---;
	lua_copy :: proc (L: ^lua_State , fromidx: c.int , toidx: c.int ) ---;
	lua_createtable :: proc (L: ^lua_State , narr: c.int , nrec: c.int ) ---;
	lua_dump :: proc (L: ^lua_State , writer: lua_Writer , data: rawptr, strip:c.int) -> c.int ---;
	lua_error :: proc (L: ^lua_State ) -> c.int ---;
	lua_gc :: proc (L: ^lua_State , what: c.int, data: c.int) -> c.int ---;
	lua_getallocf :: proc (L: ^lua_State , ud: ^rawptr ) -> lua_Alloc ---;
	lua_getfield :: proc (L: ^lua_State , idx: c.int , k: cstring) -> c.int ---;
	lua_getglobal :: proc (L: ^lua_State , name: cstring) -> c.int ---;
	lua_gethook :: proc (L: ^lua_State ) -> lua_Hook ---;
	lua_gethookcount :: proc(L: ^lua_State ) -> c.int ---;
	lua_gethookmask :: proc (L: ^lua_State ) -> c.int ---;
	lua_geti :: proc (L: ^lua_State , idx: c.int , n: lua_Integer) -> c.int ---;
	lua_getinfo :: proc (L: ^lua_State , what: cstring, ar: ^lua_Debug ) -> c.int ---;
	lua_getlocal :: proc (L: ^lua_State , ar: ^lua_Debug , n: c.int) -> cstring ---;
	lua_getmetatable :: proc (L: ^lua_State , objindex:c.int ) -> c.int ---;
	lua_getstack :: proc (L: ^lua_State ,  level: c.int, ar: ^lua_Debug) -> c.int --- ;
	lua_gettable :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_gettop :: proc (L: ^lua_State ) -> c.int ---;
	lua_getupvalue :: proc (L: ^lua_State , funcindex: c.int , n: c.int) -> cstring ---;
	lua_getuservalue :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_iscfunction :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_isinteger :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_isnumber :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_isstring :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_isuserdata :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_isyieldable :: proc (L: ^lua_State ) -> c.int ---;
	lua_len :: proc (L: ^lua_State , idx: c.int) ---;
	lua_load :: proc (L: ^lua_State , reader:lua_Reader, dt: rawptr, chunkname: cstring, mode: cstring) -> c.int --- ;
	lua_newstate :: proc (f: lua_Alloc, ud :rawptr) -> ^lua_State ---;
	lua_newthread :: proc (L: ^lua_State ) -> ^lua_State ---;
	lua_newuserdata :: proc (L: ^lua_State ,  sz:c.ptrdiff_t) -> rawptr ---;
	lua_next :: proc (L: ^lua_State , idx: c.int) -> c.int ---;
	lua_pcallk :: proc (L: ^lua_State , nargs: c.int, nresults: c.int, errfunc: c.int, ctx: lua_KContext , k: lua_KFunction ) -> c.int  ---;
	lua_pushboolean :: proc (L: ^lua_State , b: c.bool ) ---;
	lua_pushcclosure :: proc (L: ^lua_State ,  fn:lua_CFunction, n:c.int) ---;
	lua_pushinteger :: proc (L: ^lua_State , n:lua_Integer ) ---;
	lua_pushlightuserdata :: proc (L: ^lua_State , p: rawptr) ---;
	lua_pushlstring :: proc (L: ^lua_State , s: cstring, len: c.ptrdiff_t) -> cstring ---;
	lua_pushnil :: proc (L: ^lua_State ) ---;
	lua_pushnumber :: proc (L: ^lua_State ,  n:lua_Number) ---;
	lua_pushstring :: proc (L: ^lua_State , s: cstring) -> cstring ---;
	lua_pushthread :: proc (L: ^lua_State ) -> c.int ---;
	lua_pushvalue :: proc (L: ^lua_State , idx:c.int ) ---;
	lua_rawequal :: proc (L: ^lua_State ,  idx1: c.int,  idx2: c.int) -> c.int ---;
	lua_rawget :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_rawgeti :: proc (L: ^lua_State , idx: c.int , n: lua_Integer) -> c.int ---;
	lua_rawgetp :: proc (L: ^lua_State , idx: c.int , p: rawptr) -> c.int ---;
	lua_rawlen :: proc (L: ^lua_State , idx: c.int ) -> c.ptrdiff_t ---;
	lua_rawset :: proc (L: ^lua_State , idx: c.int ) ---;
	lua_rawseti :: proc (L: ^lua_State , idx: c.int , n: lua_Integer) ---;
	lua_rawsetp :: proc (L: ^lua_State , idx: c.int , p: rawptr) ---;
	lua_resume :: proc (L: ^lua_State , from: ^lua_State, narg: c.int) -> c.int ---;
	lua_rotate :: proc (L: ^lua_State , idx:c.int , n:c.int) ---;
	lua_setallocf :: proc (L: ^lua_State , f: lua_Alloc , ud: rawptr ) ---;
	lua_setfield :: proc (L: ^lua_State , idx: c.int , k: cstring) ---;
	lua_setglobal :: proc (L: ^lua_State , name: cstring) ---;
	lua_sethook :: proc (L: ^lua_State , func: lua_Hook , mask: c.int, count: c.int ) ---;
	lua_seti :: proc (L: ^lua_State , idx: c.int , n: lua_Integer) ---;
	lua_setlocal :: proc (L: ^lua_State , ar: ^lua_Debug , n: c.int) -> cstring ---;
	lua_setmetatable :: proc (L: ^lua_State , objindex: c.int ) -> c.int ---;
	lua_settable :: proc (L: ^lua_State , idx: c.int ) ---;
	lua_settop :: proc (L: ^lua_State , idx:c.int ) ---;
	lua_setupvalue :: proc (L: ^lua_State , funcindex: c.int , n: c.int) -> cstring ---;
	lua_setuservalue :: proc (L: ^lua_State , idx: c.int ) ---;
	lua_status :: proc (L: ^lua_State ) -> c.int ---;
	lua_stringtonumber :: proc (L: ^lua_State , s: cstring) -> c.ptrdiff_t ---;
	lua_toboolean :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_tocfunction :: proc (L: ^lua_State , idx: c.int ) -> lua_CFunction ---;
	lua_tointegerx :: proc (L: ^lua_State , idx: c.int , isnum: ^c.int) -> lua_Integer ---;
	lua_tolstring :: proc (L: ^lua_State , idx: c.int , len: ^c.ptrdiff_t) -> cstring ---;
	lua_tonumberx :: proc (L: ^lua_State , idx: c.int , isnum: ^c.int) -> lua_Number ---;
	lua_topointer :: proc (L: ^lua_State , idx: c.int ) -> rawptr ---;
	lua_tothread :: proc (L: ^lua_State , idx: c.int ) -> ^lua_State ---;
	lua_touserdata :: proc (L: ^lua_State , idx: c.int ) -> rawptr ---;
	lua_type :: proc (L: ^lua_State , idx: c.int ) -> c.int ---;
	lua_typename :: proc (L: ^lua_State , tp: c.int ) -> cstring ---;
	lua_upvalueid :: proc (L: ^lua_State , fidx: c.int, n: c.int) -> rawptr ---;
	lua_upvaluejoin :: proc (L: ^lua_State , fidx1: c.int, n1: c.int, fidx2: c.int, n2: c.int) ---;
	lua_version :: proc (L: ^lua_State ) -> ^lua_Number ---;
	lua_xmove :: proc (from: ^lua_State, to: ^lua_State, n:c.int) ---;
	lua_yieldk :: proc (L: ^lua_State , nresults: c.int, ctx: lua_KContext, k: lua_KFunction ) -> c.int ---;
	luaL_argerror :: proc (L: ^lua_State , arg: c.int , extramsg: cstring) -> c.int ---;
	luaL_callmeta :: proc (L: ^lua_State , obj: c.int , e: cstring ) -> c.int ---;
	luaL_checkany :: proc (L: ^lua_State , arg: c.int) ---;
	luaL_checkinteger :: proc (L: ^lua_State , arg: c.int) -> lua_Integer ---;
	luaL_checklstring :: proc (L: ^lua_State , arg: c.int , l: ^c.ptrdiff_t)-> cstring ---;
	luaL_checknumber :: proc (L: ^lua_State , arg: c.int ) -> lua_Number ---;
	luaL_checkoption :: proc (L: ^lua_State , arg: c.int, def: cstring, lst : ^cstring ) -> c.int ---;
	luaL_checkstack :: proc (L: ^lua_State , sz: c.int , msg: cstring) ---;
	luaL_checktype :: proc (L: ^lua_State , arg: c.int, t: c.int) ---;
	luaL_checkudata :: proc (L: ^lua_State , ud: c.int , tname: cstring) -> rawptr ---;
	luaL_checkversion_ :: proc (L: ^lua_State , ver:lua_Number , sz: c.ptrdiff_t ) ---;
	luaL_execresult :: proc (L: ^lua_State , stat: c.int ) -> c.int ---;
	luaL_fileresult :: proc (L: ^lua_State , stat: c.int , fname: cstring) -> c.int ---;
	luaL_getmetafield :: proc (L: ^lua_State , obj: c.int , e: cstring ) -> c.int ---;
	luaL_getsubtable :: proc (L: ^lua_State , idx: c.int , fname: cstring) -> c.int ---;
	luaL_gsub :: proc (L : ^lua_State, s: cstring, p: cstring, r: cstring) -> cstring ---;
	luaL_len :: proc (L: ^lua_State , idx: c.int ) -> lua_Integer ---;
	luaL_loadbufferx :: proc (L: ^lua_State , buff: cstring, sz: c.ptrdiff_t , name: cstring, mode: cstring) -> c.int ---;
	luaL_loadfilex :: proc (L: ^lua_State , filename: cstring, mode: cstring) -> c.int ---;
	luaL_loadstring :: proc (L: ^lua_State , s: cstring) -> c.int ---;
	luaL_newmetatable :: proc (L: ^lua_State , tname: cstring) -> c.int ---;
	luaL_newstate :: proc () -> ^lua_State ---;
	luaL_openlibs :: proc (L: ^lua_State) ---;
	luaL_optinteger :: proc (L: ^lua_State , arg: c.int,def: lua_Integer ) -> lua_Integer ---;
	luaL_optlstring :: proc (L: ^lua_State , arg: c.int , def: cstring, l: ^c.ptrdiff_t) -> cstring ---;
	luaL_optnumber :: proc (L: ^lua_State , arg: c.int , def:lua_Number) -> lua_Number ---;
	luaL_ref :: proc (L: ^lua_State , t: c.int ) -> c.int ---;
	luaL_requiref :: proc (L: ^lua_State , modname: cstring, openf: lua_CFunction , glb: c.int ) ---;
	luaL_setfuncs :: proc (L: ^lua_State , l: ^luaL_Reg, nup: c.int ) --- ;
	luaL_setmetatable :: proc (L: ^lua_State , tname: cstring) ---;
	luaL_testudata :: proc (L: ^lua_State , ud: c.int , tname: cstring) -> rawptr ---;
	luaL_tolstring :: proc (L: ^lua_State , idx: c.int , len: ^c.ptrdiff_t) -> cstring ---;
	luaL_traceback :: proc (L: ^lua_State , L1: ^lua_State ,msg: cstring, level: c.int ) ---;
	luaL_where :: proc (L: ^lua_State , lvl: c.int ) ---;
}

/*
	CONSTANTS
*/
LUA_VERSION_MAJOR ::	"5";
LUA_VERSION_MINOR ::	"3";
LUA_VERSION_NUM ::		503;
LUA_VERSION_RELEASE ::	"5";

LUA_VERSION ::	"Lua " + LUA_VERSION_MAJOR + "." + LUA_VERSION_MINOR;
LUA_RELEASE ::	LUA_VERSION + "." + LUA_VERSION_RELEASE;
LUA_COPYRIGHT ::	LUA_RELEASE + "  Copyright (C) 1994-2018 Lua.org, PUC-Rio";
LUA_AUTHORS ::	"R. Ierusalimschy, L. H. de Figueiredo, W. Celes";

LUA_SIGNATURE :: "\x1bLua";
LUA_MULTRET	:: (-1);

LUA_NUMBER :: c.float;
LUA_INTEGER :: c.longlong;
LUA_KCONTEXT :: c.ptrdiff_t;
LUA_IDSIZE :: 60;
LUA_UNSIGNED :: u64;
LUAI_MAXSTACK :: 1000000;
LUA_EXTRASPACE :: size_of(rawptr);

lua_Number :: LUA_NUMBER;
lua_Integer :: LUA_INTEGER;
lua_Unsigned :: LUA_UNSIGNED;
lua_KContext :: LUA_KCONTEXT;

LUA_REGISTRYINDEX :: (-LUAI_MAXSTACK - 1000);

LUA_OK 			:: 0;
LUA_YIELD 		:: 1;
LUA_ERRRUN 		:: 2;
LUA_ERRSYNTAX 	:: 3;
LUA_ERRMEM 		:: 4;
LUA_ERRGCMM 	:: 5;
LUA_ERRERR 		:: 6;

LUA_TNONE 				::	(-1);

LUA_TNIL 				::	0;
LUA_TBOOLEAN 			::	1;
LUA_TLIGHTUSERDATA 		::	2;
LUA_TNUMBER 			::	3;
LUA_TSTRING 			::	4;
LUA_TTABLE 				::	5;
LUA_TFUNCTION 			::	6;
LUA_TUSERDATA 			::	7;
LUA_TTHREAD 			::	8;

LUA_NUMTAGS 			::	9;

LUA_MINSTACK ::	20;

LUA_RIDX_MAINTHREAD 		::	1;
LUA_RIDX_GLOBALS 			::	2;
LUA_RIDX_LAST 				:: LUA_RIDX_GLOBALS;

LUA_OPADD :: 0;
LUA_OPSUB :: 1;
LUA_OPMUL :: 2;
LUA_OPMOD :: 3;
LUA_OPPOW :: 4;
LUA_OPDIV :: 5;
LUA_OPIDIV :: 6;
LUA_OPBAND :: 7;
LUA_OPBOR :: 8;
LUA_OPBXOR :: 9;
LUA_OPSHL :: 10;
LUA_OPSHR :: 11;
LUA_OPUNM :: 12;
LUA_OPBNOT :: 13;

LUA_OPEQ ::	0;
LUA_OPLT ::	1;
LUA_OPLE ::	2;

LUA_GCSTOP 			:: 0;
LUA_GCRESTART 		:: 1;
LUA_GCCOLLECT 		:: 2;
LUA_GCCOUNT 		:: 3;
LUA_GCCOUNTB 		:: 4;
LUA_GCSTEP 			:: 5;
LUA_GCSETPAUSE 		:: 6;
LUA_GCSETSTEPMUL	:: 7;
LUA_GCISRUNNING 	:: 9;

LUA_HOOKCALL 		:: 0;
LUA_HOOKRET 		:: 1;
LUA_HOOKLINE 		:: 2;
LUA_HOOKCOUNT 		:: 3;
LUA_HOOKTAILCALL 	:: 4;

LUA_MASKCALL :: (1 << LUA_HOOKCALL);
LUA_MASKRET :: (1 << LUA_HOOKRET);
LUA_MASKLINE :: (1 << LUA_HOOKLINE);
LUA_MASKCOUNT :: (1 << LUA_HOOKCOUNT);

LUA_ERRFILE :: (LUA_ERRERR+1);
LUA_LOADED_TABLE :: "_LOADED";
LUA_PRELOAD_TABLE :: "_PRELOAD";

LUAL_NUMSIZES :: (size_of(lua_Integer)*16 + size_of(lua_Number));

LUA_NOREF :: -2;
LUA_REFNIL :: -1;

/*
	TYPES
*/
lua_CFunction :: proc "c" (L: ^lua_State ) -> c.int;
lua_KFunction :: proc "c" (L: ^lua_State , status: c.int , ctx:lua_KContext) -> c.int;
lua_Reader :: proc "c" (L: ^lua_State , ud: rawptr , sz: ^c.ptrdiff_t) -> cstring;
lua_Writer :: proc "c" (L: ^lua_State , p: cstring, sz:c.ptrdiff_t , ud:rawptr) -> c.int ;
luaL_unref :: proc "c" (L: ^lua_State , t: c.int , ref: c.int );
lua_Hook :: proc "c" (L: ^lua_State , ar: ^lua_Debug );
lua_Alloc :: proc "c" (ud: rawptr, ptr: rawptr, osize:c.ptrdiff_t, nsize:c.ptrdiff_t) -> rawptr;

// lua_ident: ^u8;

lua_State :: struct{};
luaL_Reg :: struct  
{
	name: cstring,
	func: lua_CFunction 
};

CallInfo :: struct {};

lua_Debug :: struct {
	event : c.int,
	name : cstring,	
	namewhat: cstring,
	what: cstring,
	source: cstring,
	currentline: c.int ,
	linedefined: c.int ,	
	lastlinedefined: c.int ,
	nups: u8,	
	nparams: u8,
	isvararg: i8,
	istailcall: i8,
	short_src: [LUA_IDSIZE]i8,
	/* private part */
	i_ci : ^CallInfo ,  
};

/*
	MACROS
*/

// lua_getextraspace :: proc (L: ^lua_State )
// {
// 	(cast(rawptr)(cast(^i8)c.ptrdiff_t(L) - LUA_EXTRASPACE));
// }	

lua_tonumber :: proc (L: ^lua_State , i: c.int) -> lua_Number
{
	return lua_Number( lua_tonumberx(L,(i),nil) );
}	

lua_tointeger :: proc (L: ^lua_State ,i: c.int) -> lua_Integer
{
	return lua_Integer( lua_tointegerx(L,(i),nil) );
}
lua_pop :: proc (L: ^lua_State ,n: c.int )
{
	lua_settop(L, -(n)-1);
}		

lua_newtable :: proc (L: ^lua_State )
{		
	lua_createtable(L, 0, 0);
}

lua_register :: proc (L: ^lua_State,n:cstring,f: lua_CFunction )
{
 	lua_pushcfunction(L, (f));
 	lua_setglobal(L, (n));
}

lua_pushcfunction :: proc (L: ^lua_State ,f: lua_CFunction )
{
	lua_pushcclosure(L, (f), 0);
}	

lua_isfunction :: proc (L: ^lua_State ,n: c.int) -> c.bool 
{
	return (lua_type(L, (n)) == LUA_TFUNCTION);
}	

lua_istable :: proc (L: ^lua_State ,n:c.int) -> c.bool
{
	return (lua_type(L, (n)) == LUA_TTABLE);
}

lua_islightuserdata :: proc (L: ^lua_State ,n:c.int) -> c.bool
{	
	return (lua_type(L, (n)) == LUA_TLIGHTUSERDATA);
}
lua_isnil :: proc (L: ^lua_State ,n:c.int ) -> c.bool
{
	return (lua_type(L, (n)) == LUA_TNIL);
}

lua_isboolean :: proc (L: ^lua_State ,n:c.int ) -> c.bool
{
	return (lua_type(L, (n)) == LUA_TBOOLEAN);
}	

lua_isthread :: proc (L: ^lua_State ,n:c.int ) -> c.bool
{
	return (lua_type(L, (n)) == LUA_TTHREAD);
}

lua_isnone :: proc (L: ^lua_State ,n:c.int ) -> c.bool
{
	return (lua_type(L, (n)) == LUA_TNONE);
}
	
lua_isnoneornil :: proc (L: ^lua_State , n:c.int) -> c.bool
{
	return (lua_type(L, (n)) <= 0);
}

lua_pushliteral :: proc (L: ^lua_State , s:cstring )	
{
	lua_pushstring(L, s);
}

lua_pushglobaltable :: proc (L: ^lua_State )
{
	lua_rawgeti(L, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS);
} 
	
lua_tostring :: proc (L: ^lua_State ,i:c.int ) -> string
{
	return string( lua_tolstring(L, (i), nil) );
}	

lua_insert :: proc (L: ^lua_State ,idx:c.int)
{
	lua_rotate(L, (idx), 1);
}	

lua_remove :: proc (L: ^lua_State ,idx: c.int)
{	
	lua_rotate(L, (idx), -1);
	lua_pop(L, 1);
}

lua_replace :: proc (L: ^lua_State ,idx: c.int)	
{
	lua_copy(L, -1, (idx));
	lua_pop(L, 1);
}

lua_yield :: proc(L : ^lua_State,n: c.int)
{
	lua_yieldk(L, (n), 0, nil);
}		

lua_call :: proc (L: ^lua_State,n:c.int,r:c.int)
{
	lua_callk(L, (n), (r), 0, nil);
}

lua_pcall :: proc (L: ^lua_State,n:c.int,r:c.int,f:c.int) -> c.int
{
	return lua_pcallk(L, (n), (r), (f), 0, nil);
}

lua_upvalueindex :: proc (i:c.int) -> c.int
{
	return (LUA_REGISTRYINDEX - (i));
}
luaL_loadfile :: proc (L: ^lua_State,f: cstring)
{
	luaL_loadfilex(L,f,nil);
}

luaL_checkversion :: proc (L: ^lua_State)
{
	luaL_checkversion_(L, LUA_VERSION_NUM, LUAL_NUMSIZES);
}

// luaL_newlibtable :: proc (L:^ lua_State,l: ^luaL_Reg)
// {
// 	lua_createtable(L, 0, size_of(l)/size_of((l)[0]) - 1);
// }

// luaL_newlib :: proc (L:^ lua_State,l: ^luaL_Reg )
// {
// 	luaL_checkversion(L);
// 	luaL_newlibtable(L,l);
// 	luaL_setfuncs(L,l,0);
// }

// luaL_argcheck :: (L:^ lua_State, cond,arg,extramsg)	\
// 		((void)((cond) || luaL_argerror(L, (arg), (extramsg))))

// luaL_checkstring :: (L:^ lua_State,n)	(luaL_checklstring(L, (n), NULL))
// luaL_optstring :: (L:^ lua_State,n,d)	(luaL_optlstring(L, (n), (d), NULL))

// luaL_typename :: (L:^ lua_State,i)	lua_typename(L, lua_type(L,(i)))

luaL_dofile :: proc (L:^ lua_State, fn: cstring)
{
	luaL_loadfile(L, fn);
	lua_pcall(L, 0, LUA_MULTRET, 0);
}

luaL_dostring :: proc (L:^ lua_State, s: cstring) -> bool
{
	if luaL_loadstring(L, s) != 0 do return false;
	if lua_pcall(L, 0, LUA_MULTRET, 0) != 0 do return false;
	return true;
}

luaL_getmetatable :: proc (L:^ lua_State,n:cstring)
{
	lua_getfield(L, LUA_REGISTRYINDEX, (n));
}

// luaL_opt :: (L:^ lua_State,f,n,d)	(lua_isnoneornil(L,(n)) ? (d) : f(L,(n)))
// luaL_loadbuffer :: (L:^ lua_State,s,sz,n)	luaL_loadbufferx(L,s,sz,n,NULL)