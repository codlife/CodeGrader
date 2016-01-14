boolean add (Node node){
	int topLevel = randomLevel(); 
	int bottomLevel = 0;
	Node<T>[] preds = (Node<T>[]) new Node[MAX_LEVEL+1];
	Node<T>[] succs = (Node<T>[]) new Node[MAX_LEVEL+1];
	while(true)
	{
		boolean found = find(node,preds,succs);
		if(found){
			return false;
		}
		else
		{
			Node<T> newNode = new Node(node,topLevel);
			for(int level=bottomLevel;level<=topLevel;level++)
			{
				Node<T> succ=succs[level];
				newNode.next[level].set(succ,false);
			}
			Node<T> pred = preds[bottomLevel];
			Node<T> succ = succs[bottomLevel];
			if(!pred.next[bottomLevel].compareAndSet(succ,newNode,false,false))
			{
				continue;
			}
			for(int level = bottomLevel+1;level<=topLevel;level++)
			{
				while(true)
				{
					pred=preds[level];
					succ=succs[level];
					if(pred.next[level].compareAndSet(succ,newNode,false,false))
					{
						break;
					}
					find(node,preds,succs);
				}
			}
			return true;
		}
	}
}


 
 

boolean remove(Node<T> node){
	int bottomLevel = 0;
	Node<T>[] preds = (Node<T>[])new Node[MAX_LEVEL+1];
	Node<T>[] succs = (Node<T>[])new Node[MAX_LEVEL+1];
	Node<T> succ;
	while(true)
	{
		boolean found=find(node,preds,succs)；  //from LockFreeSkipList
		// Node<T> found = findAndMarkMinx();
		if(!found){
			return false;
		}
		else
		{
			Node<T> nodeToRemove = found;
			for(int level=nodeToRemove.topLevel;level>=bottomLevel+1;level--)
			{ 
				boolean[] marked = {false};
				succ  = nodeToRemove.next[level].get(marked);
				while(!marked[0])
				{
					nodeToRemove.next[level].compareAndSet(succ,succ,false,true);
					succ=nodeToRemove.next[level].get(marked);
				}
			} 
			boolean[] marked = {false};
			succ = nodeToRemove.next[bottomLevel].get(marked);
			while(true)
			{
				boolean iMarkedIt = nodeToRemove.next[bottomLevel].compareAndSet(succ,succ,false,true);
				succ = succs[bottomLevel].next[bottomLevel].get(marked);
				if(iMarkedIt)
				{
					findAndMarkMinx();
					return true;
				}
				else if(marked[0])
					return false;
			}
		}
	}






	
}