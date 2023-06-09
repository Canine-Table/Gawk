#!/usr/bin/awk -f

func square (x) {
  return x * x
}

func assigning_fs(){
    if(PROCINFO["FS"] == "FS"){
        return "regular field spliting"
    } else if(PROCINFO["FS"] == "FIELDWIDTHS"){
        return "fixed width field splitting"
    } else {
        return "content based field splitting"
    }
}

func get_csv_info(){
    FPAT="([^,]+)|(\"[^\"]+\")"
    return FPAT
}

BEGIN{
    print square(4)\
}
