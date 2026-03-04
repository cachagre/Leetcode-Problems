class Solution {
    public int numSpecial(int[][] mat) {
        int count=0;
        int m=mat.length;
        int n=mat[0].length;
        for(int i=0;i<m;i++){
            int count_one_in_row=0;
            int colindex=-1;
            for(int j=0;j<n;j++){
                if(mat[i][j]==1){
                    count_one_in_row++;
                    colindex=j;
                }
            }
            if(count_one_in_row!=1) continue;
            int count_one_in_col=0;
            for(int j=0;j<m;j++){
                if(mat[j][colindex]==1){
                    count_one_in_col++;
                }
            }
            if(count_one_in_col==1){
                count++;
            }
        }
        return count;
    }
}
