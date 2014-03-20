/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-y44
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ExampleMPAX
{
    static final String VERS = "@(#) xdc-y44\n";

    static final Proto.Elm $$T_Bool = Proto.Elm.newBool();
    static final Proto.Elm $$T_Num = Proto.Elm.newNum();
    static final Proto.Elm $$T_Str = Proto.Elm.newStr();
    static final Proto.Elm $$T_Obj = Proto.Elm.newObj();

    static final Proto.Fxn $$T_Met = new Proto.Fxn(null, null, 0, -1, false);
    static final Proto.Map $$T_Map = new Proto.Map($$T_Obj);
    static final Proto.Arr $$T_Vec = new Proto.Arr($$T_Obj);

    static final XScriptO $$DEFAULT = Value.DEFAULT;
    static final Object $$UNDEF = Undefined.instance;

    static final Proto.Obj $$Package = (Proto.Obj)Global.get("$$Package");
    static final Proto.Obj $$Module = (Proto.Obj)Global.get("$$Module");
    static final Proto.Obj $$Instance = (Proto.Obj)Global.get("$$Instance");
    static final Proto.Obj $$Params = (Proto.Obj)Global.get("$$Params");

    static final Object $$objFldGet = Global.get("$$objFldGet");
    static final Object $$objFldSet = Global.get("$$objFldSet");
    static final Object $$proxyGet = Global.get("$$proxyGet");
    static final Object $$proxySet = Global.get("$$proxySet");
    static final Object $$delegGet = Global.get("$$delegGet");
    static final Object $$delegSet = Global.get("$$delegSet");

    Scriptable xdcO;
    Session ses;
    Value.Obj om;

    boolean isROV;
    boolean isCFG;

    Proto.Obj pkgP;
    Value.Obj pkgV;

    ArrayList<Object> imports = new ArrayList<Object>();
    ArrayList<Object> loggables = new ArrayList<Object>();
    ArrayList<Object> mcfgs = new ArrayList<Object>();
    ArrayList<Object> icfgs = new ArrayList<Object>();
    ArrayList<String> inherits = new ArrayList<String>();
    ArrayList<Object> proxies = new ArrayList<Object>();
    ArrayList<Object> sizes = new ArrayList<Object>();
    ArrayList<Object> tdefs = new ArrayList<Object>();

    void $$IMPORTS()
    {
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.platforms.generic");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ExampleMPAX.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ExampleMPAX", new Value.Obj("ExampleMPAX", pkgP));
    }

    void Platform$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ExampleMPAX.Platform.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ExampleMPAX.Platform", new Value.Obj("ExampleMPAX.Platform", po));
        pkgV.bind("Platform", vo);
        // decls 
        om.bind("ExampleMPAX.Platform.Board", om.findStrict("xdc.platform.IPlatform.Board", "ExampleMPAX"));
        om.bind("ExampleMPAX.Platform.Memory", om.findStrict("xdc.platform.IPlatform.Memory", "ExampleMPAX"));
        // insts 
        Object insP = om.bind("ExampleMPAX.Platform.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ExampleMPAX.Platform$$Object", new Proto.Obj());
        Object objP = om.bind("ExampleMPAX.Platform.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ExampleMPAX.Platform$$Params", new Proto.Obj());
        om.bind("ExampleMPAX.Platform.Params", new Proto.Str(po, true));
    }

    void Platform$$CONSTS()
    {
        // module Platform
    }

    void Platform$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ExampleMPAX.Platform$$create", new Proto.Fxn(om.findStrict("ExampleMPAX.Platform.Module", "ExampleMPAX"), om.findStrict("ExampleMPAX.Platform.Instance", "ExampleMPAX"), 3, 2, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "args", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ExampleMPAX.Platform.Params", "ExampleMPAX"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ExampleMPAX$Platform$$create = function( name, args, __params ) {\n");
            sb.append("var __mod = xdc.om['ExampleMPAX.Platform'];\n");
            sb.append("var __inst = xdc.om['ExampleMPAX.Platform.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ExampleMPAX']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {name:name, args:args});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.externalMemoryMap = __mod.PARAMS.externalMemoryMap;\n");
            sb.append("__inst.customMemoryMap = __mod.PARAMS.customMemoryMap;\n");
            sb.append("__inst.renameMap = __mod.PARAMS.renameMap;\n");
            sb.append("__inst.dataMemory = __mod.PARAMS.dataMemory;\n");
            sb.append("__inst.codeMemory = __mod.PARAMS.codeMemory;\n");
            sb.append("__inst.stackMemory = __mod.PARAMS.stackMemory;\n");
            sb.append("__inst.sectMap = __mod.PARAMS.sectMap;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name, args]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ExampleMPAX.Platform$$construct", new Proto.Fxn(om.findStrict("ExampleMPAX.Platform.Module", "ExampleMPAX"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ExampleMPAX.Platform$$Object", "ExampleMPAX"), null);
                fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                fxn.addArg(2, "args", $$T_Obj, $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("ExampleMPAX.Platform.Params", "ExampleMPAX"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ExampleMPAX$Platform$$construct = function( __obj, name, args, __params ) {\n");
            sb.append("var __mod = xdc.om['ExampleMPAX.Platform'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {name:name, args:args});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.externalMemoryMap = __mod.PARAMS.externalMemoryMap;\n");
            sb.append("__inst.customMemoryMap = __mod.PARAMS.customMemoryMap;\n");
            sb.append("__inst.renameMap = __mod.PARAMS.renameMap;\n");
            sb.append("__inst.dataMemory = __mod.PARAMS.dataMemory;\n");
            sb.append("__inst.codeMemory = __mod.PARAMS.codeMemory;\n");
            sb.append("__inst.stackMemory = __mod.PARAMS.stackMemory;\n");
            sb.append("__inst.sectMap = __mod.PARAMS.sectMap;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Platform$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Platform$$SIZES()
    {
    }

    void Platform$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ExampleMPAX/Platform.xs");
        om.bind("ExampleMPAX.Platform$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ExampleMPAX.Platform.Module", "ExampleMPAX");
        po.init("ExampleMPAX.Platform.Module", om.findStrict("xdc.platform.IPlatform.Module", "ExampleMPAX"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("CPU", (Proto)om.findStrict("ti.platforms.generic.Platform.Instance", "ExampleMPAX"), $$UNDEF, "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ExampleMPAX.Platform$$create", "ExampleMPAX"), Global.get("ExampleMPAX$Platform$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ExampleMPAX.Platform$$construct", "ExampleMPAX"), Global.get("ExampleMPAX$Platform$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ExampleMPAX.Platform$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ExampleMPAX.Platform$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ExampleMPAX.Platform$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ExampleMPAX.Platform$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ExampleMPAX.Platform.Instance", "ExampleMPAX");
        po.init("ExampleMPAX.Platform.Instance", om.findStrict("xdc.platform.IPlatform.Instance", "ExampleMPAX"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("codeMemory", $$T_Str, "L2SRAM", "wh");
        po.addFld("dataMemory", $$T_Str, "L2SRAM", "wh");
        po.addFld("stackMemory", $$T_Str, "L2SRAM", "wh");
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "ExampleMPAX"), fxn);
        po = (Proto.Obj)om.findStrict("ExampleMPAX.Platform$$Params", "ExampleMPAX");
        po.init("ExampleMPAX.Platform.Params", om.findStrict("xdc.platform.IPlatform$$Params", "ExampleMPAX"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("codeMemory", $$T_Str, "L2SRAM", "wh");
        po.addFld("dataMemory", $$T_Str, "L2SRAM", "wh");
        po.addFld("stackMemory", $$T_Str, "L2SRAM", "wh");
        po = (Proto.Obj)om.findStrict("ExampleMPAX.Platform$$Object", "ExampleMPAX");
        po.init("ExampleMPAX.Platform.Object", om.findStrict("ExampleMPAX.Platform.Instance", "ExampleMPAX"));
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "ExampleMPAX"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "ExampleMPAX"), fxn);
    }

    void Platform$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ExampleMPAX.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ExampleMPAX"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ExampleMPAX", Value.DEFAULT, false);
        pkgV.bind("$name", "ExampleMPAX");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ExampleMPAX.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ExampleMPAX'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Platform$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ExampleMPAX.Platform", "ExampleMPAX");
        po = (Proto.Obj)om.findStrict("ExampleMPAX.Platform.Module", "ExampleMPAX");
        vo.init2(po, "ExampleMPAX.Platform", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ExampleMPAX.Platform$$capsule", "ExampleMPAX"));
        vo.bind("Instance", om.findStrict("ExampleMPAX.Platform.Instance", "ExampleMPAX"));
        vo.bind("Params", om.findStrict("ExampleMPAX.Platform.Params", "ExampleMPAX"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ExampleMPAX.Platform.Params", "ExampleMPAX")).newInstance());
        vo.bind("$package", om.findStrict("ExampleMPAX", "ExampleMPAX"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Board", om.findStrict("xdc.platform.IPlatform.Board", "ExampleMPAX"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Board", "ExampleMPAX"));
        vo.bind("Memory", om.findStrict("xdc.platform.IPlatform.Memory", "ExampleMPAX"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Memory", "ExampleMPAX"));
        vo.bind("MemoryMap", om.findStrict("xdc.platform.IPlatform.MemoryMap", "ExampleMPAX"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ExampleMPAX")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ExampleMPAX.Platform$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ExampleMPAX.Platform.Object", "ExampleMPAX"));
        pkgV.bind("Platform", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Platform");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ExampleMPAX.Platform", "ExampleMPAX"));
        vo = (Value.Obj)om.findStrict("ExampleMPAX.Platform", "ExampleMPAX");
        Global.put(vo, "CPU", Global.callFxn("create", (Scriptable)om.find("ti.platforms.generic.Platform"), "CPU", Global.newObject("clockRate", 1000L, "catalogName", "ti.catalog.c6000", "deviceName", "TMS320C6678", "externalMemoryMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"DDR3", Global.newObject("name", "DDR3", "base", 0x80000000L, "len", 0x10000000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"DDR_PRIVATE", Global.newObject("name", "DDR_PRIVATE", "base", 0x90000000L, "len", 0x10000000L, "space", "code/data", "access", "RWX")})}), "l2Mode", "0k", "l1PMode", "32k", "l1DMode", "32k")));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ExampleMPAX.Platform")).bless();
        ((Value.Arr)om.findStrict("$packages", "ExampleMPAX")).add(pkgV);
    }

    public void exec( Scriptable xdcO, Session ses )
    {
        this.xdcO = xdcO;
        this.ses = ses;
        om = (Value.Obj)xdcO.get("om", null);

        Object o = om.geto("$name");
        String s = o instanceof String ? (String)o : null;
        isCFG = s != null && s.equals("cfg");
        isROV = s != null && s.equals("rov");

        $$IMPORTS();
        $$OBJECTS();
        Platform$$OBJECTS();
        Platform$$CONSTS();
        Platform$$CREATES();
        Platform$$FUNCTIONS();
        Platform$$SIZES();
        Platform$$TYPES();
        if (isROV) {
            Platform$$ROV();
        }//isROV
        $$SINGLETONS();
        Platform$$SINGLETONS();
        $$INITIALIZATION();
    }
}
