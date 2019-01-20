A <- matrix(c(4, -1, 1, -1, 4.25, 2.75, 1, 2.75, 3.5), nc=3)
chol(A)

R <- chol(A, pivot = TRUE)
pivot <- attr(R, "pivot")
A[pivot, pivot]
t(R) %*% R

B <- c(1,2,2,4); dim(B) <- c(2,2)
chol(B)
chol(B, pivot = TRUE)

R <- chol(B, pivot = TRUE)
pivot <- attr(R, "pivot")
B[pivot, pivot]; t(R) %*% R

M<-c(4,2,1,2,6,3,1,3,0); dim(M)<-c(3,3)
R<-chol(M,  pivot = TRUE); pivot <- attr(R, "pivot")
M[pivot, pivot]; t(R) %*% R
