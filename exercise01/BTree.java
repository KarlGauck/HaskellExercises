public Interface<A, B> Mapper
{
    public B map (A value);
}

public Class<A> BTree
{
    private A value;
    private BTree<A> left;
    private BTree<A> right;

    public BTree(A value, BTree<A> left, BTree<A> right)
    {
        this.value = value;
        this.left = left;
        this.right = right;
    }

    public Tree<B> map(Mapper<A, B> mapper)
    {
        if (left == null && right == null)
            return new Tree<B>(mapper.map(value), null, null);
        if (left == null) 
            return new Tree<B>(mapper.map(value), null, right.map());
        if (right == null)
            return new Tree<B>(mapper.map(value), left.map(), null);
        return new Tree<B>(mapper.map(value), left.map(), right.map());
    }
}