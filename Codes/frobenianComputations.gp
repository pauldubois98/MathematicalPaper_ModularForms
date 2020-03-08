P = z^4+1;
Q8 = nfinit(P);
M0 = rnfinit(Q8, y^2-(z+z^7), 1);
M1 = nfinit(M0);
M = bnfinit(M1[1]);

/* generator for the torsion units */
mu = M.tu[2];
/* fundamental units */
v1 = M.fu[1];
v2 = M.fu[2];
v3 = M.fu[3];

forvec(X=[[0,1],[0,1],[0,1],[0,1]], {
	if(X==[0,0,0,0], {
		next()
	});

	/* element to extend */
	alpha = mu^X[1]*v1^X[2]*v2^X[3]*v3^X[4];

	/* extension */
	L0 = rnfinit(M1, x^2-alpha, 0);
	L = nfinit(L0);
	G = galoisinit(L);

	/* *** avoid non galois ext *** */
	if(G==0, {
		print(" not Galois");
		next()
	});
	
	/* open file */
	filename = Str("a_02_ext_" X[1] X[2] X[3] X[4] ".txt");
	file = fileopen(filename, "w");
	print(filename);
	filewrite(file, "Extension");
	filewrite(file, "#3");
	filewrite(file, "\\mu");
	filewrite(file, "\\sqrt[4]{2}");
	filewrite(file, "sqrt(alpha)");

	/* first group identification */
	filewrite(file, "Galois identify");
	filewrite(file, galoisidentify(G));
	filewrite(file, "\n");
	
	/* second conjugacy classes */
	filewrite(file, "Galois conjug classes");
	filewrite(file, galoisconjclasses(G));
	filewrite(file, "\n");
	
	/* forbenius elemnts of primes >2 */
	forprime(p=3, b=10150, pr = idealprimedec(L,p)[1]; idealfrob = idealfrobenius(L,G,pr); filewrite(file, p); filewrite(file, idealfrob));
	
	/*pr = idealprimedec(L,3)[1];
	idealfrob = idealfrobenius(L,G,pr);
	print("idealfrob: ", idealfrob);*/
	
	fileclose(file)

})
