module challenge_1::cat_object;

public struct Cat has key, store {
    id: UID,
    name: String,
    color: String
}

public fun new(name: String, color: String, ctx: &mut TxContext): Cat  {
    let cat = Cat {
        id: object::new(ctx),
        name: name,
        color: color
    };
    cat
}

public fun tchau(cat: Cat) {
    let Cat {id, name: _, color: _} = cat;
    object::delete(id);
}

public fun paint(cat: &mut Cat, new_color: vector<u8>, ctx: &mut TxContext) {
    cat.color = new_color;
}
