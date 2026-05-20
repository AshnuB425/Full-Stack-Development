from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404
from .models import InterviewRound
from .serializers import InterviewRoundSerializer

class InterviewRoundList(APIView):
    def get(self, request):
        rounds = InterviewRound.objects.all()
        serializer = InterviewRoundSerializer(rounds, many=True, context={'request': request})
        return Response(serializer.data)

    def post(self, request):
        serializer = InterviewRoundSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CandidateRoundsView(APIView):
    def get(self, request, candidate_id):
        rounds = InterviewRound.objects.filter(candidate_id=candidate_id)
        if not rounds.exists():
            return Response({"error": "Candidate not found"}, status=404)
        serializer = InterviewRoundSerializer(rounds, many=True, context={'request': request})
        return Response(serializer.data)

class InterviewRoundDetail(APIView):
    def put(self, request, pk):
        round_obj = get_object_or_404(InterviewRound, pk=pk)
        serializer = InterviewRoundSerializer(round_obj, data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        round_obj = get_object_or_404(InterviewRound, pk=pk)
        round_obj.delete()
        return Response({"message": "Record deleted successfully"}, status=status.HTTP_204_NO_CONTENT)